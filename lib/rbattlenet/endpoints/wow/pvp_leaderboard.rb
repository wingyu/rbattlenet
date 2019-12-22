module RBattlenet
  module Wow
    class PvpLeaderboard < RBattlenet::Endpoints::Base
      def self.path(leaderboard)
        RBattlenet.uri("data/wow/pvp-season/#{leaderboard[:season]}/pvp-leaderboard/#{leaderboard[:bracket]}?namespace=dynamic-")
      end
    end
  end
end
