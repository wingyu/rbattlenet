module RBattlenet
  module Wow
    class Challenge
      def self.search_realm(realm)
        realm =  RBattlenet.parse_spaces(realm)

        uri = RBattlenet.
          base_uri("#{GAME}/challenge/#{realm}")

        RBattlenet.get(uri)
      end

      def self.search_region
        uri = RBattlenet.
          base_uri("#{GAME}/challenge/region")

        RBattlenet.get(uri)
      end
    end
  end
end

