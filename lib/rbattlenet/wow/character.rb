module RBattlenet
  module Wow
    class Character
      def self.search(name, realm, field = nil)
        field = RBattlenet.parse_field(field)
        realm = realm.gsub(" ", '%20')

        uri = RBattlenet.
          base_uri("#{GAME}/character/#{realm}/#{name}?fields=#{field}")

        HTTParty.get(uri)
      end
    end
  end
end

