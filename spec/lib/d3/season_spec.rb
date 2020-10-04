require 'spec_helper'

describe RBattlenet::D3::Season, type: :game_data do

  describe "#find_season" do
    it "fetches season data" do
      with_connection("d3_season") do
        result = RBattlenet::D3::Season.find(1)
        expect(result.leaderboard.size).to be >= 29
      end
    end
  end

  describe "#find_multiple_seasons" do
    it "fetches season data" do
      with_connection("d3_season_multiple") do
        collection = RBattlenet::D3::Season.find([1, 2])
        expect(collection.results.map(&:leaderboard).map(&:size).sort).to eq [29, 29]
      end
    end
  end

  describe "#find_all_seasons" do
    it "fetches all season data" do
      with_connection("d3_season_all") do
        result = RBattlenet::D3::Season.all
        expect(result.season.size).to be >= 19
      end
    end
  end
end
