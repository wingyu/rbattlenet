module RBattlenet
  module Wow
    class MythicKeystoneLeaderboard < RBattlenet::Endpoints::Base
      def self.path(leaderboard)
        RBattlenet.uri("data/wow/connected-realm/#{leaderboard[:connected_realm_id]}/mythic-leaderboard/#{leaderboard[:dungeon_id]}/period/#{leaderboard[:period]}?namespace=dynamic-")
      end
    end
  end
end
