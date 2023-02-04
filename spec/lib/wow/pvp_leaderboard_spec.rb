require 'spec_helper'

describe RBattlenet::Wow::PvpLeaderboard do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_pvp_leaderboard" do
    it "fetches pvp leaderboard data" do
      with_connection("wow_pvp_leaderboard") do
        result = RBattlenet::Wow::PvpLeaderboard.find(season: 27, bracket: "2v2")
        expect(result.entries.size).to be >= 5000
      end
    end
  end

  describe "#find_multiple_pvp_leaderboards" do
    it "fetches pvp leaderboard data" do
      with_connection("wow_pvp_leaderboard_multiple") do
        collection = RBattlenet::Wow::PvpLeaderboard.find([
          { season: 27, bracket: "2v2" },
          { season: 27, bracket: "3v3" }
        ])
        expect(collection.map(&:entries).map(&:class)).to eq [Array, Array]
      end
    end
  end
end
