require 'spec_helper'

describe RBattlenet::Wow::Character::ActiveQuests do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_character_active_quests" do
    it "fetches character data" do
      with_connection("wow_character_active_quests") do
        result = RBattlenet::Wow::Character::ActiveQuests.find(realm: "stormrage", name: "sheday")
        expect(result.in_progress.class).to eq Array
      end
    end
  end

  describe "#find_multiple_character_active_questss" do
    it "fetches character data" do
      with_connection("wow_character_active_quests_multiple") do
        collection = RBattlenet::Wow::Character::ActiveQuests.find([
          { realm: "stormrage", name: "sheday" },
          { realm: "howling-fjord", name: "альвеоняша" },
        ])
        expect(collection.map(&:in_progress).map(&:class)).to eq [Array, Array]
      end
    end
  end
end
