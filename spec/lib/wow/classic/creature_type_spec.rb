require 'spec_helper'

describe RBattlenet::Wow::Classic::CreatureType do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_creature_type" do
    it "fetches creature type data" do
      with_connection("wow_classic_creature_type") do
        result = RBattlenet::Wow::Classic::CreatureType.find(1)
        expect(result.name).to eq "Beast"
      end
    end
  end

  describe "#find_multiple_creature_types" do
    it "fetches creature type data" do
      with_connection("wow_classic_creature_type_multiple") do
        collection = RBattlenet::Wow::Classic::CreatureType.find([1, 2])
        expect(collection.results.map(&:name).sort).to eq ["Beast", "Dragonkin"]
      end
    end
  end

  describe "#find_all_creature_types" do
    it "fetches all creature type data" do
      with_connection("wow_classic_creature_type_all") do
        result = RBattlenet::Wow::Classic::CreatureType.all
        expect(result.creature_types.size).to be >= 11
      end
    end
  end
end
