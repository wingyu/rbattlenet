module RBattlenet
  module D3
    class ItemType < RBattlenet::Endpoints::Base
      def self.path(id)
        RBattlenet.uri("d3/data/item-type/#{id}?")
      end

      def self.index_path
        RBattlenet.uri("d3/data/item-type?")
      end
    end
  end
end
