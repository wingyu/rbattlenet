require 'spec_helper'

describe RBattlenet::Wow::AzeriteEssence do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_azerite_essence" do
    it "fetches azerite essence data" do
      with_connection("wow_azerite_essence") do
        result = RBattlenet::Wow::AzeriteEssence.find(2)
        expect(result.name).to eq "Azeroth's Undying Gift"
      end
    end
  end

  describe "#find_multiple_azerite_essences" do
    it "fetches azerite essence data" do
      with_connection("wow_azerite_essence_multiple") do
        collection = RBattlenet::Wow::AzeriteEssence.find([2, 3])
        expect(collection.results.map(&:name).sort).to eq ["Azeroth's Undying Gift", "Sphere of Suppression"]
      end
    end
  end

  describe "#find_all_azerite_essences" do
    it "fetches all azerite essence data" do
      with_connection("wow_azerite_essence_all") do
        result = RBattlenet::Wow::AzeriteEssence.all
        expect(result.azerite_essences.size).to be >= 21
      end
    end
  end
end
