module RBattlenet
  module D3
    class EraLeaderboard < RBattlenet::Endpoints::Base
      def self.path(leaderboard)
        RBattlenet.uri("data/d3/era/#{leaderboard[:era]}/leaderboard/#{leaderboard[:id]}?")
      end
    end
  end
end
