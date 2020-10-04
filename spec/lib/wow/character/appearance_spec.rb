require 'spec_helper'

describe RBattlenet::Wow::Character::Appearance, type: :game_data do

  describe "#find_character_appearance" do
    it "fetches character data" do
      with_connection("wow_character_appearance") do
        result = RBattlenet::Wow::Character::Appearance.find(realm: "stormrage", name: "sheday")
        expect(result.appearance.face_variation).to eq 11
      end
    end
  end

  describe "#find_multiple_character_appearances" do
    it "fetches character data" do
      with_connection("wow_character_appearance_multiple") do
        collection = RBattlenet::Wow::Character::Appearance.find([
          { realm: "stormrage", name: "sheday" },
          { realm: "howling-fjord", name: "альвеоняша" },
        ])
        expect(collection.results.map(&:appearance).map(&:face_variation).sort).to eq [2, 11]
      end
    end
  end
end
