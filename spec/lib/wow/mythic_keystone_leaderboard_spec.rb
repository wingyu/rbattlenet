require 'spec_helper'

describe RBattlenet::Wow::MythicKeystoneLeaderboard do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_mythic_keystone_leaderboard" do
    it "fetches keystone leaderboard data" do
      with_connection("wow_mythic_keystone_leaderboard") do
        result = RBattlenet::Wow::MythicKeystoneLeaderboard.find(
          connected_realm_id: 509, dungeon_id: 244, period: 682
        )
        expect(result.map.name).to eq "Atal'Dazar"
      end
    end
  end

  describe "#find_multiple_mythic_keystone_leaderboards" do
    it "fetches keystone leaderboard data" do
      with_connection("wow_mythic_keystone_leaderboard_multiple") do
        collection = RBattlenet::Wow::MythicKeystoneLeaderboard.find([
          { connected_realm_id: 509, dungeon_id: 244, period: 682 },
          { connected_realm_id: 510, dungeon_id: 244, period: 682 },
        ])
        expect(collection.results.map(&:map).map(&:name).sort).to eq ["Atal'Dazar", "Atal'Dazar"]
      end
    end
  end
end
