require 'spec_helper'

describe RBattlenet::Sc2::League do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

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
        expect(collection.size).to eq 2
        expect(collection[0].tier.first.division.first.ladder_id).to eq 204698
        expect(collection[1].tier.first.division.first.ladder_id).to eq 207508
      end
    end
  end
end
