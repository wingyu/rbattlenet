require 'spec_helper'

describe RBattlenet::Sc2::League, type: :game_data do

  describe "#find_league" do
    it "fetches league data" do
      with_connection("sc2_league") do
        result = RBattlenet::Sc2::League.find(season: 37, queue: 201, team_type: 0, id: 6)
        expect(result.tier.first.division.first.ladder_id).to eq 207508
      end
    end
  end

  describe "#find_multiple_leagues" do
    it "fetches league data" do
      with_connection("sc2_league_multiple") do
        collection = RBattlenet::Sc2::League.find([
          { season: 36, queue: 201, team_type: 0, id: 6 },
          { season: 37, queue: 201, team_type: 0, id: 6 },
        ])
        expect(collection.results.size).to eq 2
        expect(collection.results[0].tier.first.division.first.ladder_id).to eq 204698
        expect(collection.results[1].tier.first.division.first.ladder_id).to eq 207508
      end
    end
  end
end
