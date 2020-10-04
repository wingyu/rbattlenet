require 'spec_helper'

describe RBattlenet::Wow::Character::Titles, type: :game_data do

  describe "#find_character_titles" do
    it "fetches character data" do
      with_connection("wow_character_titles") do
        result = RBattlenet::Wow::Character::Titles.find(realm: "stormrage", name: "sheday")
        expect(result.active_title.name.class).to eq String
      end
    end
  end
end
