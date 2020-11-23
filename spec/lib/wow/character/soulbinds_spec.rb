require 'spec_helper'

describe RBattlenet::Wow::Character::Soulbinds do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_character_soulbinds" do
    it "fetches character data" do
      with_connection("wow_character_soulbinds") do
        result = RBattlenet::Wow::Character::Soulbinds.find(realm: "stormrage", name: "sheday")
        expect(result.soulbinds.class).to eq Array
      end
    end
  end
end
