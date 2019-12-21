module RBattlenet
  module D3
    class Hero < RBattlenet::Endpoints::Base
      SUPPORTED_FIELDS = [:itself, :items, :follower_items]

      def self.path(hero)
        RBattlenet.uri("d3/profile/#{hero[:battletag]}/hero/#{hero[:id]}?")
      end

      def self.items
        RBattlenet::D3::Hero::Items
      end

      def self.follower_items
        RBattlenet::D3::Hero::FollowerItems
      end
    end
  end
end
