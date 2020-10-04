require 'spec_helper'

describe RBattlenet::D3::SeasonLeaderboard, type: :game_data do

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
        expect(collection.results.map(&:row).map(&:class).sort).to eq [Array, Array]
      end
    end
  end
end
