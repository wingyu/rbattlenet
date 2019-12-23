module RBattlenet
  module Sc2
    class League < RBattlenet::Endpoints::Base
      def self.path(league)
        RBattlenet.uri("data/sc2/league/#{league[:season]}/#{league[:queue]}/#{league[:team_type]}/#{league[:id]}?")
      end
    end
  end
end
