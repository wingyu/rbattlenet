require 'spec_helper'

describe RBattlenet::Hearthstone::Metadata do

  describe "#find_metadata" do
    it "fetches metadata" do
      with_connection("hearthstone_metadata") do
        result = RBattlenet::Hearthstone::Metadata.find(:sets)
        expect(result.data.size).to be >= 20
      end
    end
  end

  describe "#find_multiple_metadata" do
    it "fetches metadata" do
      with_connection("hearthstone_metadata_multiple") do
        collection = RBattlenet::Hearthstone::Metadata.find([:sets, :keywords])
        expect(collection.results.map(&:data).map(&:size).sort).to eq [20, 31]
      end
    end
  end

  describe "#find_all_metadata" do
    it "fetches all metadata" do
      with_connection("hearthstone_metadata_all") do
        result = RBattlenet::Hearthstone::Metadata.all
        expect(result.sets.size).to be >= 20
        expect(result.keywords.size).to be >= 31
      end
    end
  end
end
