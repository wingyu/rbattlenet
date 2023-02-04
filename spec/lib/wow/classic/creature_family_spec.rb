require 'spec_helper'

describe RBattlenet::Wow::Classic::CreatureFamily do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_creature_family" do
    it "fetches creature family data" do
      with_connection("wow_classic_creature_family") do
        result = RBattlenet::Wow::Classic::CreatureFamily.find(1)
        expect(result.name).to eq "Wolf"
      end
    end
  end

  describe "#find_multiple_creature_families" do
    it "fetches creature family data" do
      with_connection("wow_classic_creature_family_multiple") do
        collection = RBattlenet::Wow::Classic::CreatureFamily.find([1, 2])
        expect(collection.map(&:name).sort).to eq ["Cat", "Wolf"]
      end
    end
  end

  describe "#find_all_creature_families" do
    it "fetches all creature family data" do
      with_connection("wow_classic_creature_family_all") do
        result = RBattlenet::Wow::Classic::CreatureFamily.all
        expect(result.creature_families.size).to be >= 23
      end
    end
  end
end
