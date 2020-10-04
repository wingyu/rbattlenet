require 'spec_helper'

describe RBattlenet::Wow::MythicRaidLeaderboard, type: :game_data do

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
        expect(collection.results.map(&:slug).sort).to eq ["crucible-of-storms-horde", "uldir-alliance"]
      end
    end
  end
end
