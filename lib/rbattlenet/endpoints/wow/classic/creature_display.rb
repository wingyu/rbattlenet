module RBattlenet
  module Wow
    module Classic
      class CreatureDisplay < RBattlenet::Endpoints::Base
        def self.path(id)
          RBattlenet.uri("data/wow/media/creature-display/#{id}?namespace=static-classic-")
        end
      end
    end
  end
end
