module RBattlenet
  @@region = "eu"
  @@locale = "en_gb"
  @@response_type = :struct
  @@concurrency = 20
  @@timeout = 120
  @@retries = 0

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

  def self.set_options(region: @@region, locale: @@locale, response_type: @@response_type, concurrency: @@concurrency, timeout: @@timeout, retries: @@retries)
    @@region, @@locale, @@response_type, @@concurrency, @@timeout, @@retries = (region || "eu"), locale, response_type, concurrency, timeout, retries
    true
  end

  private

  class << self
    def get(subjects)
      retried = {}
      store = @@response_type == :raw ? [] : RBattlenet::ResultCollection.new(@@response_type)

      headers = {}
      headers['Authorization'] = "Bearer #{@@token}" if @@token

      # Limit concurrency to prevent hitting the API request per-second cap.
      hydra = Typhoeus::Hydra.new(max_concurrency: @@concurrency)
      subjects.each do |uris, subject|
        subject_brackets = []

        uris.each do |field, uri|
          request = Typhoeus::Request.new(Addressable::URI.parse(uri).normalize.to_s, headers: headers, timeout: @@timeout, connecttimeout: @@timeout)

          request.on_complete do |response|
            if @@retries > 0 && (retried[uri] || 0) < @@retries && (response.timed_out? || response.code == 429)
              retried[uri] = (retried[uri] || 0) + 1
              hydra.queue response.request
            elsif @@response_type == :raw
              store << response
            else
              # TODO: make this generic and move it to a proper place!
              if field == :pvp_summary && uri.include?("pvp-summary") && response.code == 200
                result = JSON.parse(response.body) rescue nil
                subject_brackets += (result&.dig('brackets') || []).map { |br| br['href'] if br['href'].include?('shuffle') }.compact

                subject_brackets.each do |bracket_uri|
                  bracket_request = Typhoeus::Request.new(Addressable::URI.parse(bracket_uri).normalize.to_s, headers: headers, timeout: @@timeout, connecttimeout: @@timeout)
                  bracket_response = bracket_request.run
                  store.add(subject, bracket_uri.split('pvp-bracket/').last.split('?').first, bracket_response)
                end
              end

              store.add(subject, field, response)
              if data = store.complete(subject, uris.size + subject_brackets.size)
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
