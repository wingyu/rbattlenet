module RBattlenet
  module D3
    class Season < RBattlenet::Endpoints::Base
      def self.path(id)
        RBattlenet.uri("data/d3/season/#{id}?")
      end

      def self.index_path
        RBattlenet.uri("data/d3/season/?")
      end
    end
  end
end
