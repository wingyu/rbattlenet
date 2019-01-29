module RBattlenet
  module Wow
    class Character
      def self.find(name:, realm:, fields: nil)
        fields = RBattlenet.parse_fields(fields)
        uri = RBattlenet.base_uri("#{GAME}/character/#{realm}/#{name}")
        RBattlenet.get(uri, fields)
      end

      #Prepare parallel requests using Typhoeus for wowaudit
      def self.find_all(characters, fields: nil)
        fields = RBattlenet.parse_fields(fields)
        requests = {}
        characters.each do |character|
          uri = RBattlenet.base_uri("#{GAME}/character/#{character.realm_slug}/#{character.name}")
          requests[uri + fields] = character
        end

        RBattlenet.get_multiple(requests)
      end
    end
  end
end

