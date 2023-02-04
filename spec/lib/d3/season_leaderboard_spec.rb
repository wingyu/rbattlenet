require 'spec_helper'

describe RBattlenet::D3::SeasonLeaderboard do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_season_leaderboard" do
    it "fetches season leaderboard data" do
      with_connection("d3_season_leaderboard") do
        result = RBattlenet::D3::SeasonLeaderboard.find(season: 1, id: 74987245615154)
        expect(result.row.class).to eq Array
      end
    end
  end

  describe "#find_multiple_season_leaderboards" do
    it "fetches season leaderboard data" do
      with_connection("d3_season_leaderboard_multiple") do
        collection = RBattlenet::D3::SeasonLeaderboard.find([
          { season: 1, id: 74987245615154 },
          { season: 1, id: 74987244621930 }
        ])
        expect(collection.map(&:row).map(&:class).sort).to eq [Array, Array]
      end
    end
  end
end
