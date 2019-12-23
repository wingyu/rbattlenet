module RBattlenet
  module D3
    class Artisan < RBattlenet::Endpoints::Base
      def self.path(id)
        RBattlenet.uri("d3/data/artisan/#{id}?")
      end
    end
  end
end
