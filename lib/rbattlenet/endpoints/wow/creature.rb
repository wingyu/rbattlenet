module RBattlenet
  module Wow
    class Creature < RBattlenet::Endpoints::Base
      def self.path(id)
        RBattlenet.uri("data/wow/creature/#{id}?namespace=static-")
      end
    end
  end
end
