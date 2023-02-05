module RBattlenet
  @@region = "eu"
  @@locale = "en_gb"
  @@response_type = :struct
  @@concurrency = 20
  @@timeout = 120
  @@retries = 0
  @@eager_children = false

  #Set Access Token for requests. Required
  def self.authenticate(client_id:, client_secret:)
    oauth_region = ["kr", "tw"].include?(@@region.downcase) ? "apac" : @@region
    response = Typhoeus.post("https://#{oauth_region}.battle.net/oauth/token",
      body: { grant_type: :client_credentials },
      userpwd: "#{client_id}:#{client_secret}",
    )
    raise RBattlenet::Errors::Unauthorized.new if response.code == 401
    @@token = Oj.load(response.body)['access_token']
    true
  end

  def self.set_options(region: @@region, locale: @@locale, response_type: @@response_type, concurrency: @@concurrency, timeout: @@timeout, retries: @@retries, eager_children: @@eager_children)
    @@region, @@locale, @@response_type, @@concurrency, @@timeout, @@retries, @@eager_children = (region || "eu"), locale, response_type, concurrency, timeout, retries, eager_children
    true
  end

  private

  class << self
    def get(subjects, block_given)
      results = []
      retried = {}
      headers = {}
      extra_requests_by_subject = {}
      headers['Authorization'] = "Bearer #{@@token}" if @@token

      # Limit concurrency to prevent hitting the API request per-second cap.
      hydra = Typhoeus::Hydra.new(max_concurrency: @@concurrency)
      subjects.each do |fields, subject|
        store = @@response_type == :raw ? [] : RBattlenet::ResultCollection.new(@@response_type)

        fields.each do |name, klass|
          uri = klass.is_a?(String) ? klass : klass.path(subject)
          request = Typhoeus::Request.new(Addressable::URI.parse(uri).normalize.to_s, headers: headers, timeout: @@timeout, connecttimeout: @@timeout)

          request.on_complete do |response|
            puts "[#{Time.now.strftime('%d-%m %H:%M:%S')}] - #{response.code} --- #{response.timed_out?} --- #{uri}"
            if @@retries > 0 && (retried[uri] || 0) < @@retries && ((response.code != 200 && response.timed_out?) || response.code == 429)
              retried[uri] = (retried[uri] || 0) + 1
              hydra.queue response.request
            elsif @@response_type == :raw
              store << response
            else
              store.add(name, response)

              if !klass.is_a?(String) && klass::EAGER_CHILDREN && @@eager_children && response.code == 200
                extra_requests_by_subject[subject] = klass.get_children(headers, store, response)
              end

              if data = store.complete(fields.size + (extra_requests_by_subject[subject] || 0))
                if block_given
                  yield subject, data
                  store = nil
                else
                  results << data
                end
              end
            end
          end

          hydra.queue request
        end
      end

      hydra.run
      (results.size == 1 ? results.first : results) unless block_given
    end

    def uri(path)
      "https://#{@@region}.api.blizzard.com/#{path}#{@@region}&locale=#{@@locale}"
    end
  end
end
