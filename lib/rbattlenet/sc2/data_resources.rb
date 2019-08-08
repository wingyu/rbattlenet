module RBattlenet
  module Sc2
    class DataResources
      def self.find_achievements(region_id:)
        uri = RBattlenet.base_uri("#{GAME}/legacy/data/achievements/#{region_id}")

        RBattlenet.get(uri)
      end

      def self.find_rewards(region_id:)
        uri = RBattlenet.base_uri("#{GAME}/legacy/data/rewards/#{region_id}")

        RBattlenet.get(uri)
      end
    end
  end
end
