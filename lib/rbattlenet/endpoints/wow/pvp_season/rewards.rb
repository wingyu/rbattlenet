module RBattlenet
  module Wow
    class PvpSeason::Rewards < RBattlenet::Endpoints::Base
      def self.path(id)
        RBattlenet.uri("data/wow/pvp-season/#{id}/pvp-reward/index?namespace=dynamic-")
      end
    end
  end
end
