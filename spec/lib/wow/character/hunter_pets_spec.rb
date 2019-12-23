require 'spec_helper'

describe RBattlenet::Wow::Character::HunterPets do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_character_hunter_pet" do
    it "fetches character data" do
      with_connection("wow_character_hunter_pet") do
        result = RBattlenet::Wow::Character::HunterPets.find(realm: "stormrage", name: "marks")
        expect(result.hunter_pets.class).to eq Array
      end
    end
  end
end
