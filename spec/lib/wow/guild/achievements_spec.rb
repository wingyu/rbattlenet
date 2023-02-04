require 'spec_helper'

describe RBattlenet::Wow::Guild::Achievements do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_guild_achievements" do
    it "fetches guild data" do
      with_connection("wow_guild_achievements") do
        result = RBattlenet::Wow::Guild::Achievements.find(realm: "stormrage", name: "avalerion")
        expect(result.achievements.class).to eq Array
      end
    end
  end

  describe "#find_multiple_guild_achievementss" do
    it "fetches guild data" do
      with_connection("wow_guild_achievements_multiple") do
        collection = RBattlenet::Wow::Guild::Achievements.find([
          { realm: "stormrage", name: "avalerion" },
          { realm: "azuremyst", name: "imperium" },
        ])
        expect(collection.map(&:achievements).map(&:class)).to eq [Array, Array]
      end
    end
  end
end
