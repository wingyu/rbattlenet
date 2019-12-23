module RBattlenet
  module Wow
    class CreatureMedia < RBattlenet::Endpoints::Base
      def self.path(id)
        RBattlenet.uri("data/wow/media/creature-display/#{id}?namespace=static-")
      end
    end
  end
end
