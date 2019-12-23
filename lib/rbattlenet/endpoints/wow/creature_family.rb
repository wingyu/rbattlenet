module RBattlenet
  module Wow
    class CreatureFamily < RBattlenet::Endpoints::Base
      def self.path(id)
        RBattlenet.uri("data/wow/creature-family/#{id}?namespace=static-")
      end

      def self.index_path
        RBattlenet.uri("data/wow/creature-family/index?namespace=static-")
      end
    end
  end
end
