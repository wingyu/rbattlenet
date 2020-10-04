require 'spec_helper'

describe RBattlenet::Wow::Character::CompletedDungeons, type: :game_data do

  describe "#find_character_completed_dungeons" do
    it "fetches character data" do
      with_connection("wow_character_completed_dungeons") do
        result = RBattlenet::Wow::Character::CompletedDungeons.find(realm: "stormrage", name: "sheday")
        expect(result.expansions.class).to eq Array
      end
    end
  end

  describe "#find_multiple_character_completed_dungeonss" do
    it "fetches character data" do
      with_connection("wow_character_completed_dungeons_multiple") do
        collection = RBattlenet::Wow::Character::CompletedDungeons.find([
          { realm: "stormrage", name: "sheday" },
          { realm: "howling-fjord", name: "альвеоняша" },
        ])
        expect(collection.results.map(&:expansions).map(&:class)).to eq [Array, Array]
      end
    end
  end
end
