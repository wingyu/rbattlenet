require 'spec_helper'

describe RBattlenet::Wow::Character::Media, type: :game_data do

  describe "#find_character_media" do
    it "fetches character data" do
      with_connection("wow_character_media") do
        result = RBattlenet::Wow::Character::Media.find(realm: "stormrage", name: "sheday")
        expect(result.render_url.class).to eq String
      end
    end
  end
end
