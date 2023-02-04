require 'spec_helper'

describe RBattlenet::Wow::Guild::Roster do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_guild_roster" do
    it "fetches guild data" do
      with_connection("wow_guild_roster") do
        result = RBattlenet::Wow::Guild::Roster.find(realm: "stormrage", name: "avalerion")
        expect(result.members.class).to eq Array
      end
    end
  end

  describe "#find_multiple_guild_rosters" do
    it "fetches guild data" do
      with_connection("wow_guild_roster_multiple") do
        collection = RBattlenet::Wow::Guild::Roster.find([
          { realm: "stormrage", name: "avalerion" },
          { realm: "azuremyst", name: "imperium" },
        ])
        expect(collection.map(&:members).map(&:class)).to eq [Array, Array]
      end
    end
  end
end
