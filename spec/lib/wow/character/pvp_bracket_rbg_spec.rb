require 'spec_helper'

describe RBattlenet::Wow::Character::PvpBracketRbg, type: :game_data do

  describe "#find_character_pvp_bracket_rbg_statistics" do
    it "fetches character data" do
      with_connection("wow_character_pvp_bracket_rbg_statistics") do
        result = RBattlenet::Wow::Character::PvpBracketRbg.find(realm: "stormrage", name: "noldorimbor")
        expect(result.rating.class).to eq Integer
      end
    end
  end
end
