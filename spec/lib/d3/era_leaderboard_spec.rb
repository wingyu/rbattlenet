require 'spec_helper'

describe RBattlenet::D3::EraLeaderboard, type: :game_data do

  describe "#find_era_leaderboard" do
    it "fetches era leaderboard data" do
      with_connection("d3_era_leaderboard") do
        result = RBattlenet::D3::EraLeaderboard.find(era: 1, id: "rift-wd")
        expect(result.row.class).to eq Array
      end
    end
  end

  describe "#find_multiple_era_leaderboards" do
    it "fetches era leaderboard data" do
      with_connection("d3_era_leaderboard_multiple") do
        collection = RBattlenet::D3::EraLeaderboard.find([
          { era: 1, id: "rift-wd" },
          { era: 1, id: "rift-hardcore-dh" }
        ])
        expect(collection.results.map(&:row).map(&:class).sort).to eq [Array, Array]
      end
    end
  end
end
