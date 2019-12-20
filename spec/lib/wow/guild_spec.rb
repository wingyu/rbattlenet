require 'spec_helper'

describe RBattlenet::Wow::Guild do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_guild" do
    it "fetches guild data" do
      with_connection("wow_guild") do
        result = RBattlenet::Wow::Guild.find(realm: "stormrage", name: "avalerion")
        expect(result.name).to eq "Avalerion"
      end
    end
  end

  describe "#find_non_existing_guild" do
    it "returns an empty result" do
      with_connection("wow_guild_empty") do
        result = RBattlenet::Wow::Guild.find(realm: "stormrage", name: "whowouldeverusethisforaguildname")
        expect(result.class).to eq RBattlenet::EmptyResult
      end
    end
  end

  describe "#find_multiple_guilds" do
    it "fetches guild data" do
      with_connection("wow_guild_multiple") do
        collection = RBattlenet::Wow::Guild.find([
          { realm: "stormrage", name: "avalerion" },
          { realm: "azuremyst", name: "imperium" },
        ])
        expect(collection.results.map(&:name).sort).to eq ["Avalerion", "Imperium"]
      end
    end
  end

  describe "#find_guild_with_multiple_fields" do
    it "fetches guild data" do
      with_connection("wow_guild_fields") do
        result = RBattlenet::Wow::Guild.find(realm: "stormrage", name: "avalerion", fields: [:members, :achievements])
        expect(result.name).to eq "Avalerion"
        expect(result.members.class).to eq Array
        expect(result.achievements.class).to eq Array
      end
    end
  end

  describe "#find_multiple_guilds_with_multiple_fields" do
    it "fetches guild data" do
      with_connection("wow_guild_multiple_fields") do
        collection = RBattlenet::Wow::Guild.find([
          { realm: "stormrage", name: "avalerion" },
          { realm: "azuremyst", name: "imperium" },
        ], fields: [:members, :achievements])
        expect(collection.results.map(&:name).sort).to eq ["Avalerion", "Imperium"]
        expect(collection.results.map(&:members).map(&:class)).to eq [Array, Array]
        expect(collection.results.map(&:achievements).map(&:class)).to eq [Array, Array]
      end
    end
  end
end
