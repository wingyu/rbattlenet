module RBattlenet
  module Wow
    module Classic
      class ItemClass < RBattlenet::Endpoints::Base
        def self.path(id)
          RBattlenet.uri("data/wow/item-class/#{id}?namespace=static-classic-")
        end

        def self.index_path
          RBattlenet.uri("data/wow/item-class/index?namespace=static-classic-")
        end
      end
    end
  end
end
