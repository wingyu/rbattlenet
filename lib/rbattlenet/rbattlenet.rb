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

  def self.option(name)
    class_variable_get("@@#{name}".to_sym)
  end

  private

  class << self
    def uri(path)
      "https://#{@@region}.api.blizzard.com/#{path}#{@@region}&locale=#{@@locale}"
    end
  end
end
