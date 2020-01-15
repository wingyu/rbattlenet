module RBattlenet
  @@region = "eu"
  @@locale = "en_gb"
  @@raw = false

  #Set Access Token for requests. Required
  def self.authenticate(client_id:, client_secret:)
    response = Typhoeus.post("https://#{@@region}.battle.net/oauth/token",
      body: { grant_type: :client_credentials },
      userpwd: "#{client_id}:#{client_secret}",
    )
    raise RBattlenet::Errors::Unauthorized.new if response.code == 401
    @@token = JSON.parse(response.body)['access_token']
    true
  end

  def self.set_options(region: @@region, locale: @@locale, raw_response: @@raw)
    @@region, @@locale, @@raw = region, locale, raw_response
    true
  end

  private

  class << self
    def get(subjects)
      store = @@raw ? [] : RBattlenet::ResultCollection.new

      headers = {}
      headers['Authorization'] = "Bearer #{@@token}" if @@token

      # Limit concurrency to prevent hitting the API request per-second cap.
      hydra = Typhoeus::Hydra.new(max_concurrency: 50)
      subjects.each do |uris, subject|
        uris.each do |field, uri|
          request = Typhoeus::Request.new(URI.encode(uri), headers: headers)

          request.on_complete do |response|
            if @@raw
              store << response
            else
              store.add(subject, field, response)
              if data = store.complete(subject, uris.size)
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
      "https://#{@@region}.api.blizzard.com/#{path}#{@@region}&locale=#{@@locale}"
    end
  end
end
