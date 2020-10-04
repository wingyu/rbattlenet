require 'spec_helper'

describe RBattlenet::Wow::Character::Pets, type: :game_data do

  describe "#find_character_professions" do
    it "fetches character data" do
      with_connection("wow_character_professions") do
        result = RBattlenet::Wow::Character::Professions.find(realm: "stormrage", name: "sheday")
        expect(result.primaries.class).to eq Array
      end
    end
  end
end
