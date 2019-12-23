module RBattlenet
  module Sc2
    class Leaderboard < RBattlenet::Endpoints::Base
      def self.path(id)
        RBattlenet.uri("sc2/ladder/grandmaster/#{id}?")
      end
    end
  end
end
