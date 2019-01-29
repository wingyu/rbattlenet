module RBattlenet
  module Wow
    class Challenge
      def self.find_realm(realm:)
        uri = RBattlenet.base_uri("#{GAME}/challenge/#{realm}")
        RBattlenet.get(uri)
      end

      def self.find_region
        uri = RBattlenet.base_uri("#{GAME}/challenge/region")
        RBattlenet.get(uri)
      end
    end
  end
end
