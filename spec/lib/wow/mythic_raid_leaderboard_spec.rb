require 'spec_helper'

describe RBattlenet::Wow::MythicRaidLeaderboard do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_mythic_raid_leaderboard" do
    it "fetches raid leaderboard data" do
      with_connection("wow_mythic_raid_leaderboard") do
        result = RBattlenet::Wow::MythicRaidLeaderboard.find(raid: "uldir", faction: "alliance")
        expect(result.entries.size).to eq 100
      end
    end
  end

  describe "#find_multiple_mythic_raid_leaderboards" do
    it "fetches raid leaderboard data" do
      with_connection("wow_mythic_raid_leaderboard_multiple") do
        collection = RBattlenet::Wow::MythicRaidLeaderboard.find([
          { raid: "uldir", faction: "alliance" },
          { raid: "crucible-of-storms", faction: "horde" }
        ])
        expect(collection.map(&:slug).sort).to eq ["crucible-of-storms-horde", "uldir-alliance"]
      end
    end
  end
end
