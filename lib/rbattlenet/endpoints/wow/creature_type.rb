module RBattlenet
  module Wow
    class CreatureType < RBattlenet::Endpoints::Base
      def self.path(id)
        RBattlenet.uri("data/wow/creature-type/#{id}?namespace=static-")
      end

      def self.index_path
        RBattlenet.uri("data/wow/creature-type/index?namespace=static-")
      end
    end
  end
end
