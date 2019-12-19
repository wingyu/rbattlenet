require 'spec_helper'

describe RBattlenet::Wow::Guild do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  # describe "#find_guild" do
  #   it "fetches guild data" do
  #     with_connection("wow_guild") do
  #       guild = RBattlenet::Wow::Guild.find(realm: "stormrage", name: "avalerion")
  #       expect(guild.name).to eq "Avalerion"
  #     end
  #   end
  # end

  # describe "#find_multiple_guilds" do
  #   it "fetches guild data" do
  #     with_connection("wow_guild") do
  #       collection = RBattlenet::Wow::Guild.find([
  #         { realm: "stormrage", name: "avalerion" },
  #         { realm: "azuremyst", name: "imperium" },
  #       ])
  #       expect(collection.results.map(&:name).sort).to eq ["Avalerion", "Imperium"]
  #     end
  #   end
  # end

  describe "#find_guild_with_multiple_fields" do
    it "fetches guild data" do
      with_connection("wow_guild") do
        guild = RBattlenet::Wow::Guild.find(realm: "stormrage", name: "avalerion", fields: [:roster, :achievements])
      end
    end
  end

  # describe "#find_multiple_guilds_with_multiple_fields" do
  #   it "fetches guild data" do
  #     with_connection("wow_guild") do
  #       collection = RBattlenet::Wow::Guild.find([18803, 18804])
  #       expect(collection.results.map(&:name).sort).to eq ["Finkle's Lava Dredger", "Lord Grayson's Satchel"]
  #     end
  #   end
  # end
end
