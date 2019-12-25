module RBattlenet
  module D3
    class Era < RBattlenet::Endpoints::Base
      def self.path(id)
        RBattlenet.uri("data/d3/era/#{id}?")
      end

      def self.index_path
        RBattlenet.uri("data/d3/era/?")
      end
    end
  end
end
