require 'spec_helper'

describe RBattlenet::Wow::Character::Pets do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_character_pets" do
    it "fetches character data" do
      with_connection("wow_character_pets") do
        result = RBattlenet::Wow::Character::Pets.find(realm: "stormrage", name: "sheday")
        expect(result.pets.class).to eq Array
      end
    end
  end
end
