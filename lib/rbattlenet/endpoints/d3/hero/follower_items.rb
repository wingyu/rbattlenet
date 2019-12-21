module RBattlenet
  module D3
    class Hero::FollowerItems < RBattlenet::Endpoints::Base
      def self.path(hero)
        RBattlenet.uri("d3/profile/#{hero[:battletag]}/hero/#{hero[:id]}/follower-items?")
      end
    end
  end
end
