require 'spec_helper'

describe RBattlenet::Wow::Character::PvpSummary do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_character_pvp_summary" do
    it "fetches character data" do
      with_connection("wow_character_pvp_summary") do
        result = RBattlenet::Wow::Character::PvpSummary.find(realm: "stormrage", name: "sheday")
        expect(result.honor_level).to be >= 41
      end
    end
  end
end
