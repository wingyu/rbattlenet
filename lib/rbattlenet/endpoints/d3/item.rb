module RBattlenet
  module D3
    class Item < RBattlenet::Endpoints::Base
      def self.path(id)
        RBattlenet.uri("d3/data/item/#{id}?")
      end
    end
  end
end
