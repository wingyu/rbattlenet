module RBattlenet
  module Wow
    module Classic
      class CreatureFamilyMedia < RBattlenet::Endpoints::Base
        def self.path(id)
          RBattlenet.uri("data/wow/media/creature-family/#{id}?namespace=static-classic-")
        end
      end
    end
  end
end
