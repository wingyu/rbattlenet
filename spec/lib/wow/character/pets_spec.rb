require 'spec_helper'

describe RBattlenet::Wow::Character::Pets, type: :game_data do

  describe "#find_character_pets" do
    it "fetches character data" do
      with_connection("wow_character_pets") do
        result = RBattlenet::Wow::Character::Pets.find(realm: "stormrage", name: "sheday")
        expect(result.pets.class).to eq Array
      end
    end
  end
end
