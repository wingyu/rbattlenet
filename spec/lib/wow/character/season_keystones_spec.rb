require 'spec_helper'

describe RBattlenet::Wow::Character::SeasonKeystones, type: :game_data do

  describe "#find_character_season_keystones" do
    it "fetches character data" do
      with_connection("wow_character_season_keystones") do
        result = RBattlenet::Wow::Character::SeasonKeystones.find(realm: "stormrage", name: "sheday", season: 3)
        expect(result.best_runs.class).to eq Array
      end
    end
  end
end
