module RBattlenet
  module Wow
    class ReputationTiers < RBattlenet::Endpoints::Base
      def self.path(id)
        RBattlenet.uri("data/wow/reputation-tiers/#{id}?namespace=static-")
      end

      def self.index_path
        RBattlenet.uri("data/wow/reputation-tiers/index?namespace=static-")
      end
    end
  end
end
