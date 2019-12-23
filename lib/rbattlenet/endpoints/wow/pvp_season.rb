module RBattlenet
  module Wow
    class PvpSeason < RBattlenet::Endpoints::Base
      SUPPORTED_FIELDS = [:itself, :rewards]

      def self.path(id)
        RBattlenet.uri("data/wow/pvp-season/#{id}?namespace=dynamic-")
      end

      def self.index_path
        RBattlenet.uri("data/wow/pvp-season/index?namespace=dynamic-")
      end

      def rewards
        RBattlenet::Wow::PvpSeason::Rewards
      end
    end
  end
end
