module RBattlenet
  module Wow
    class ReputationFaction < RBattlenet::Endpoints::Base
      def self.path(id)
        RBattlenet.uri("data/wow/reputation-faction/#{id}?namespace=static-")
      end

      def self.index_path
        RBattlenet.uri("data/wow/reputation-faction/index?namespace=static-")
      end
    end
  end
end
