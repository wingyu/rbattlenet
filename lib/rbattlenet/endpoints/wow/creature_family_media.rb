module RBattlenet
  module Wow
    class CreatureFamilyMedia < RBattlenet::Endpoints::Base
      def self.path(id)
        RBattlenet.uri("data/wow/media/creature-family/#{id}?namespace=static-")
      end
    end
  end
end
