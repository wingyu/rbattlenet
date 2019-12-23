require 'spec_helper'

describe RBattlenet::Wow::Character::Mounts do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_character_mounts" do
    it "fetches character data" do
      with_connection("wow_character_mounts") do
        result = RBattlenet::Wow::Character::Mounts.find(realm: "stormrage", name: "sheday")
        expect(result.mounts.class).to eq Array
      end
    end
  end
end
