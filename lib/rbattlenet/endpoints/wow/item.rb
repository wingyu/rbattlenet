module RBattlenet
  module Wow
    class Item < RBattlenet::Endpoints::Base
      def self.path(item)
        RBattlenet.uri("data/wow/item/#{item}")
      end
    end
  end
end
