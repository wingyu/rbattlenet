require 'spec_helper'

describe RBattlenet::Wow::Character::Specializations, type: :game_data do

  describe "#find_character_specializations" do
    it "fetches character data" do
      with_connection("wow_character_specializations") do
        result = RBattlenet::Wow::Character::Specializations.find(realm: "stormrage", name: "sheday")
        expect(result.specializations.class).to eq Array
      end
    end
  end
end
