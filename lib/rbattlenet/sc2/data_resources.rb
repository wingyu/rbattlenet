module RBattlenet
  module Sc2
    class DataResources
      def self.find_achievements
        uri = RBattlenet.base_uri("#{GAME}/data/achievements")

        RBattlenet.get(uri)
      end

      def self.find_rewards
        uri = RBattlenet.base_uri("#{GAME}/data/rewards")

        RBattlenet.get(uri)
      end
    end
  end
end
