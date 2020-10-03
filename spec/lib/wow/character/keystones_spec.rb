require 'spec_helper'

describe RBattlenet::Wow::Character::Keystones, type: :game_data do

  describe "#find_character_keystones" do
    it "fetches character data" do
      with_connection("wow_character_keystones") do
        result = RBattlenet::Wow::Character::Keystones.find(realm: "stormrage", name: "sheday")
        expect(result.current_period.best_runs.class).to eq Array
      end
    end
  end
end
