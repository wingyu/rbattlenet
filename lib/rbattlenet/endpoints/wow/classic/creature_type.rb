module RBattlenet
  module Wow
    module Classic
      class CreatureType < RBattlenet::Endpoints::Base
        def self.path(id)
          RBattlenet.uri("data/wow/creature-type/#{id}?namespace=static-classic-")
        end

        def self.index_path
          RBattlenet.uri("data/wow/creature-type/index?namespace=static-classic-")
        end
      end
    end
  end
end
