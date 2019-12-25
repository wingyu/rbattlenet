module RBattlenet
  module D3
    class Hero::Items < RBattlenet::Endpoints::Base
      def self.path(hero)
        RBattlenet.uri("d3/profile/#{hero[:battletag]}/hero/#{hero[:id]}/items?")
      end
    end
  end
end
