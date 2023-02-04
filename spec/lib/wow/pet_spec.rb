require 'spec_helper'

describe RBattlenet::Wow::Pet do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_pet" do
    it "fetches pet data" do
      with_connection("wow_pet") do
        result = RBattlenet::Wow::Pet.find(39)
        expect(result.name).to eq "Mechanical Squirrel"
      end
    end
  end

  describe "#find_multiple_pets" do
    it "fetches pet data" do
      with_connection("wow_pet_multiple") do
        collection = RBattlenet::Wow::Pet.find([40, 39])
        expect(collection.map(&:name).sort).to eq ["Bombay Cat", "Mechanical Squirrel"]
      end
    end
  end

  describe "#find_all_pets" do
    it "fetches all pet data" do
      with_connection("wow_pet_all") do
        result = RBattlenet::Wow::Pet.all
        expect(result.pets.size).to be >= 368
      end
    end
  end
end
