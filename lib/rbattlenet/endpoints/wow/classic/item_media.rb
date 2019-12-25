module RBattlenet
  module Wow
    module Classic
      class ItemMedia < RBattlenet::Endpoints::Base
        def self.path(id)
          RBattlenet.uri("data/wow/media/item/#{id}?namespace=static-classic-")
        end
      end
    end
  end
end
