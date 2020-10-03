require 'spec_helper'

describe RBattlenet::Wow::Region, type: :game_data do

  describe "#find_region" do
    it "fetches region data" do
      with_connection("wow_region") do
        result = RBattlenet::Wow::Region.find(3)
        expect(result.tag).to eq "EU"
      end
    end
  end

  describe "#find_all_regions" do
    it "fetches all region data" do
      with_connection("wow_region_all") do
        result = RBattlenet::Wow::Region.all
        expect(result.regions.size).to eq 1
      end
    end
  end
end
