module RBattlenet
  module Wow
    class Item < RBattlenet::Endpoints::Base
      def self.path(id)
        RBattlenet.uri("data/wow/item/#{id}?namespace=static-")
      end
    end
  end
end
