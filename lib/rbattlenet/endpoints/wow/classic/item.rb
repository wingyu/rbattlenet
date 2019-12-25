module RBattlenet
  module Wow
    module Classic
      class Item < RBattlenet::Endpoints::Base
        def self.path(id)
          RBattlenet.uri("data/wow/item/#{id}?namespace=static-classic-")
        end
      end
    end
  end
end
