module RBattlenet
  module Wow
    class ItemMedia < RBattlenet::Endpoints::Base
      def self.path(id)
        RBattlenet.uri("data/wow/media/item/#{id}?namespace=static-")
      end
    end
  end
end
