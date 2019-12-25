module RBattlenet
  module D3
    class Act < RBattlenet::Endpoints::Base
      def self.path(id)
        RBattlenet.uri("d3/data/act/#{id}?")
      end

      def self.index_path
        RBattlenet.uri("d3/data/act?")
      end
    end
  end
end
