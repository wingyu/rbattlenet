module RBattlenet
  module D3
    class Recipe < RBattlenet::Endpoints::Base
      def self.path(recipe)
        RBattlenet.uri("d3/data/artisan/#{recipe[:artisan]}/recipe/#{recipe[:id]}?")
      end
    end
  end
end
