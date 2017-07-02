module RBattlenet
  module Wow
    class Character
      def self.find(name:, realm:, fields: nil)
        fields = RBattlenet.parse_fields(fields)
        queries = RBattlenet.merge_queries(fields)

        uri = RBattlenet.
          base_uri("#{GAME}/character/#{realm}/#{name}")

        RBattlenet.get(uri, queries)
      end

      #Prepare parallel requests using Typhoeus for wowaudit
      def self.prepare_multiple(characters:, fields: nil)
        fields = RBattlenet.parse_fields(fields)
        queries = RBattlenet.merge_queries(fields)

        characters.each do |character|
          uri = RBattlenet.base_uri("#{GAME}/character/#{character.realm_slug}/#{character.name}")
          character.uri = URI.escape(uri + queries)
        end

        RBattlenet.process_multiple(characters)
      end
    end
  end
end

