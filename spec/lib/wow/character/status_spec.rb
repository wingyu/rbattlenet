require 'spec_helper'

describe RBattlenet::Wow::Character::Status do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_character_status" do
    it "fetches character data" do
      with_connection("wow_character_status") do
        result = RBattlenet::Wow::Character::Status.find(realm: "stormrage", name: "sheday")
        expect(result.is_valid).to eq true
      end
    end
  end
end
