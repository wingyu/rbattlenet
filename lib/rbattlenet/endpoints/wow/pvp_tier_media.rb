module RBattlenet
  module Wow
    class PvpTierMedia < RBattlenet::Endpoints::Base
      def self.path(id)
        RBattlenet.uri("data/wow/media/pvp-tier/#{id}?namespace=static-")
      end
    end
  end
end
