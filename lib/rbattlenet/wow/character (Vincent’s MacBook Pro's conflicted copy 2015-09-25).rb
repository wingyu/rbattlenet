module RBattlenet
  module Wow
    class Character
     include HTTParty

      @options = { query: {locale: @@locale, apikey: API_KEY} }
      self.class.base_uri("https://#{@@region}.api.battle.net/")

      def self.search(name, realm, field = nil)
        field = RBattlenet.parse_field(field)
        realm = realm.gsub(" ", '%20')

        uri = RBattlenet.
          base_uri("#{GAME}/character/#{realm}/#{name}?fields=#{field}")

        get(uri)
      end
    end
  end
end

