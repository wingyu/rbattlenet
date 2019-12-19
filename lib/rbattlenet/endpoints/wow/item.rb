module RBattlenet
  module Wow
    class Item < RBattlenet::Endpoints::Base
      def self.path(item)
        RBattlenet.uri("data/wow/item/#{item}?namespace=static-")
      end
    end
  end
end
