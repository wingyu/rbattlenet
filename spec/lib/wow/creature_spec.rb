require 'spec_helper'

describe RBattlenet::Wow::Creature do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_creature" do
    it "fetches creature data" do
      with_connection("wow_creature") do
        result = RBattlenet::Wow::Creature.find(30)
        expect(result.name).to eq "Forest Spider"
      end
    end
  end

  describe "#find_multiple_creatures" do
    it "fetches creature data" do
      with_connection("wow_creature_multiple") do
        collection = RBattlenet::Wow::Creature.find([30, 330])
        expect(collection.map(&:name).sort).to eq ["Forest Spider", "Princess"]
      end
    end
  end
end
