module RBattlenet
  module D3
    class SeasonLeaderboard < RBattlenet::Endpoints::Base
      def self.path(leaderboard)
        RBattlenet.uri("data/d3/season/#{leaderboard[:season]}/leaderboard/#{leaderboard[:id]}?")
      end
    end
  end
end
