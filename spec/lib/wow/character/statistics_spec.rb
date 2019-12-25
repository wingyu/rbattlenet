require 'spec_helper'

describe RBattlenet::Wow::Character::Statistics do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_character_statistics" do
    it "fetches character data" do
      with_connection("wow_character_statistics") do
        result = RBattlenet::Wow::Character::Statistics.find(realm: "stormrage", name: "sheday")
        expect(result.health.class).to eq Integer
      end
    end
  end
end
