require 'spec_helper'

describe RBattlenet::Wow::Character::CompletedQuests, type: :game_data do

  describe "#find_character_completed_quests" do
    it "fetches character data" do
      with_connection("wow_character_completed_quests") do
        result = RBattlenet::Wow::Character::CompletedQuests.find(realm: "stormrage", name: "sheday")
        expect(result.quests.class).to eq Array
      end
    end
  end

  describe "#find_multiple_character_completed_questss" do
    it "fetches character data" do
      with_connection("wow_character_completed_quests_multiple") do
        collection = RBattlenet::Wow::Character::CompletedQuests.find([
          { realm: "stormrage", name: "sheday" },
          { realm: "howling-fjord", name: "альвеоняша" },
        ])
        expect(collection.results.map(&:quests).map(&:class)).to eq [Array, Array]
      end
    end
  end
end
