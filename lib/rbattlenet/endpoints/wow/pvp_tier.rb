module RBattlenet
  module Wow
    class PvpTier < RBattlenet::Endpoints::Base
      def self.path(id)
        RBattlenet.uri("data/wow/pvp-tier/#{id}?namespace=static-")
      end

      def self.index_path
        RBattlenet.uri("data/wow/pvp-tier/index?namespace=static-")
      end
    end
  end
end
