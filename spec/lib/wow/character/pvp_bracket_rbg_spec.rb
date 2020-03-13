require 'spec_helper'

describe RBattlenet::Wow::Character::PvpBracketRbg do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_character_pvp_bracket_rbg_statistics" do
    it "fetches character data" do
      with_connection("wow_character_pvp_bracket_rbg_statistics") do
        result = RBattlenet::Wow::Character::PvpBracketRbg.find(realm: "stormrage", name: "noldorimbor")
        expect(result.rating.class).to eq Integer
      end
    end
  end
end
