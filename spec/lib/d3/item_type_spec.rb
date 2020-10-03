require 'spec_helper'

describe RBattlenet::D3::ItemType, type: :community do

  describe "#find_item_type" do
    it "fetches item_type data" do
      with_connection("d3_item_type") do
        result = RBattlenet::D3::ItemType.find("sword2h")
        expect(result.data.size).to be >= 37
      end
    end
  end

  describe "#find_multiple_item_types" do
    it "fetches item_type data" do
      with_connection("d3_item_type_multiple") do
        collection = RBattlenet::D3::ItemType.find(["sword2h", "axe2h"])
        expect(collection.results.map(&:data).map(&:size).sort).to eq [27, 37]
      end
    end
  end

  describe "#find_all_item_types" do
    it "fetches all item_type data" do
      with_connection("d3_item_type_all") do
        result = RBattlenet::D3::ItemType.all
        expect(result.data.size).to be >= 111
      end
    end
  end
end
