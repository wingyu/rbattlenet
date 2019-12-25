module RBattlenet
  module Wow
    module Classic
      class Creature < RBattlenet::Endpoints::Base
        def self.path(id)
          RBattlenet.uri("data/wow/creature/#{id}?namespace=static-classic-")
        end
      end
    end
  end
end
