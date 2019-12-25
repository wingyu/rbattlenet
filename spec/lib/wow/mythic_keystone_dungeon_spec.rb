require 'spec_helper'

describe RBattlenet::Wow::MythicKeystoneDungeon do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_mythic_keystone_dungeon" do
    it "fetches mythic keystone dungeon data" do
      with_connection("wow_mythic_keystone_dungeon") do
        result = RBattlenet::Wow::MythicKeystoneDungeon.find(244)
        expect(result.name).to eq "Atal'Dazar"
      end
    end
  end

  describe "#find_multiple_mythic_keystone_dungeons" do
    it "fetches mythic keystone dungeon data" do
      with_connection("wow_mythic_keystone_dungeon_multiple") do
        collection = RBattlenet::Wow::MythicKeystoneDungeon.find([244, 245])
        expect(collection.results.map(&:name).sort).to eq ["Atal'Dazar", "Freehold"]
      end
    end
  end

  describe "#find_all_mythic_keystone_dungeons" do
    it "fetches all mythic keystone dungeon data" do
      with_connection("wow_mythic_keystone_dungeon_all") do
        result = RBattlenet::Wow::MythicKeystoneDungeon.all
        expect(result.dungeons.size).to be >= 4
      end
    end
  end
end
