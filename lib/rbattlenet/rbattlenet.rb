module RBattlenet
  @@region = "eu"
  @@locale = "en_gb"
  @@response_type = :struct
  @@concurrency = 20
  @@timeout = 120
  @@token = nil

  #Set Access Token for requests. Required
  def self.authenticate(client_id:, client_secret:)
    oauth_region = ["kr", "tw"].include?(@@region.downcase) ? "apac" : @@region
    response = Typhoeus.post("https://#{oauth_region}.battle.net/oauth/token",
      body: { grant_type: :client_credentials },
      userpwd: "#{client_id}:#{client_secret}",
    )
    raise RBattlenet::Errors::Unauthorized.new if response.code == 401
    @@token = JSON.parse(response.body)['access_token']
    true
  end

  # Set a fake token for RSpec tests
  def self.fake_authenticate
    @@token = "abcdefghijklmnopqrstuvwxyz01234567"
  end

  def self.set_options(region: @@region, locale: @@locale, response_type: @@response_type, concurrency: @@concurrency, timeout: @@timeout)
    @@region, @@locale, @@response_type, @@concurrency, @@timeout = region, locale, response_type, concurrency, timeout
    true
  end

  private

  class << self
    def get(subjects)
      store = @@response_type == :raw ? [] : RBattlenet::ResultCollection.new(@@response_type)

      # Limit concurrency to prevent hitting the API request per-second cap.
      hydra = Typhoeus::Hydra.new(max_concurrency: @@concurrency)
      subjects.each do |uris, subject|
        uris.each do |field, uri|
          headers = {}
          headers['Authorization'] = "Bearer #{@@token}" if @@token && !uri.include?('access_token')
          request = Typhoeus::Request.new(URI::DEFAULT_PARSER.escape(uri), headers: headers, timeout: @@timeout)

          request.on_complete do |response|
            if @@response_type == :raw
              store << response
            else
              store.add(subject, field, response)
              if (data = store.complete(subject, uris.size))
                yield subject, data
              end
            end
          end

          hydra.queue request
        end
      end

      hydra.run
      store.size == 1 ? store.first : store
    end

    def uri(path)
      request_locale = @@locale == 'all' ? '' : "&locale=#{@@locale}"

      "https://#{@@region}.api.blizzard.com/#{path}#{@@region}#{request_locale}"
    end
  end
end
