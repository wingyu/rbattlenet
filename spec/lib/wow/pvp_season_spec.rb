require 'spec_helper'

describe RBattlenet::Wow::PvpSeason, type: :game_data do

  describe "#find_pvp_season" do
    it "fetches pvp season data" do
      with_connection("wow_pvp_season") do
        result = RBattlenet::Wow::PvpSeason.find(27)
        expect(result.season_start_timestamp).to eq 1548226800000
      end
    end
  end

  describe "#find_multiple_pvp_seasons" do
    it "fetches pvp season data" do
      with_connection("wow_pvp_season_multiple") do
        collection = RBattlenet::Wow::PvpSeason.find([27, 28])
        expect(collection.results.map(&:season_start_timestamp)).to eq [1548226800000, 1562742000000]
      end
    end
  end

  describe "#find_all_pvp_seasons" do
    it "fetches all pvp season data" do
      with_connection("wow_pvp_season_all") do
        result = RBattlenet::Wow::PvpSeason.all
        expect(result.seasons.size).to eq 7
      end
    end
  end
end
