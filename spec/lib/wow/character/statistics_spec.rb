require 'spec_helper'

describe RBattlenet::Wow::Character::Statistics, type: :game_data do

  describe "#find_character_statistics" do
    it "fetches character data" do
      with_connection("wow_character_statistics") do
        result = RBattlenet::Wow::Character::Statistics.find(realm: "stormrage", name: "sheday")
        expect(result.health.class).to eq Integer
      end
    end
  end
end
