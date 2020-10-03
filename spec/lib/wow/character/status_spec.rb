require 'spec_helper'

describe RBattlenet::Wow::Character::Status, type: :game_data do

  describe "#find_character_status" do
    it "fetches character data" do
      with_connection("wow_character_status") do
        result = RBattlenet::Wow::Character::Status.find(realm: "stormrage", name: "sheday")
        expect(result.is_valid).to eq true
      end
    end
  end
end
