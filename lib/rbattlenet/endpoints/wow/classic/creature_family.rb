module RBattlenet
  module Wow
    module Classic
      class CreatureFamily < RBattlenet::Endpoints::Base
        def self.path(id)
          RBattlenet.uri("data/wow/creature-family/#{id}?namespace=static-classic-")
        end

        def self.index_path
          RBattlenet.uri("data/wow/creature-family/index?namespace=static-classic-")
        end
      end
    end
  end
end
