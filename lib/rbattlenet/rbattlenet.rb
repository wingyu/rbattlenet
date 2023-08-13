module RBattlenet
  @@region = "eu"
  @@namespace = @@region
  @@locale = "en_gb"
  @@response_type = :struct
  @@concurrency = 20
  @@timeout = 120
  @@retries = 0
  @@eager_children = false

  #Set Access Token for requests. Required
  def self.authenticate(client_id:, client_secret:, depth: 0)
    oauth_region = ["kr", "tw"].include?(@@region.downcase) ? "apac" : @@region
    response = Typhoeus.post("https://#{oauth_region}.battle.net/oauth/token",
      body: { grant_type: :client_credentials },
      userpwd: "#{client_id}:#{client_secret}",
    )
    raise RBattlenet::Errors::Unauthorized.new if response.code == 401

    if response.code >= 500
      puts "Blizzard's server returned an error. Retrying... #{depth + 1}/10"
      return self.authenticate(client_id: client_id, client_secret: client_secret, depth: depth + 1) if depth < 10
      raise RBattlenet::Errors::RemoteServerError.new
    end

    @@token = Oj.load(response.body)['access_token']
    true
  end

  def self.set_options(region: @@region, namespace: @@namespace, locale: @@locale, response_type: @@response_type, concurrency: @@concurrency, timeout: @@timeout, retries: @@retries, eager_children: @@eager_children)
    @@region, @@namespace, @@locale, @@response_type, @@concurrency, @@timeout, @@retries, @@eager_children = (region || "eu"), namespace, locale, response_type, concurrency, timeout, retries, eager_children
    true
  end

  def self.option(name)
    class_variable_get("@@#{name}".to_sym)
  end

  private

  class << self
    def uri(path)
      "https://#{@@region}.api.blizzard.com/#{path}#{@@namespace}&locale=#{@@locale}"
    end
  end
end
