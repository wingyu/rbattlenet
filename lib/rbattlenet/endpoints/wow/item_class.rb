module RBattlenet
  module Wow
    class ItemClass < RBattlenet::Endpoints::Base
      def self.path(id)
        RBattlenet.uri("data/wow/item-class/#{id}?namespace=static-")
      end

      def self.index_path
        RBattlenet.uri("data/wow/item-class/index?namespace=static-")
      end
    end
  end
end
