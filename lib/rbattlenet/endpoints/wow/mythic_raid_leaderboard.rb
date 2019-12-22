module RBattlenet
  module Wow
    class MythicRaidLeaderboard < RBattlenet::Endpoints::Base
      def self.path(leaderboard)
        RBattlenet.uri("data/wow/leaderboard/hall-of-fame/#{leaderboard[:raid]}/#{leaderboard[:faction]}?namespace=dynamic-")
      end
    end
  end
end
