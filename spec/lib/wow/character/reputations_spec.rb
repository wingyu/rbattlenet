require 'spec_helper'

describe RBattlenet::Wow::Character::Reputations, type: :game_data do

  describe "#find_character_reputations" do
    it "fetches character data" do
      with_connection("wow_character_reputations") do
        result = RBattlenet::Wow::Character::Reputations.find(realm: "stormrage", name: "sheday")
        expect(result.reputations.class).to eq Array
      end
    end
  end
end
