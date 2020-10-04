require 'spec_helper'

describe RBattlenet::Wow::AzeriteEssenceMedia, type: :game_data do

  describe "#find_azerite_essence_media" do
    it "fetches azerite essence media data" do
      with_connection("wow_azerite_essence_media") do
        result = RBattlenet::Wow::AzeriteEssenceMedia.find(2)
        expect(result.assets.size).to be >= 1
      end
    end
  end

  describe "#find_multiple_azerite_essence_media" do
    it "fetches azerite essence media data" do
      with_connection("wow_azerite_essence_media_multiple") do
        collection = RBattlenet::Wow::AzeriteEssenceMedia.find([2, 3])
        expect(collection.results.map(&:assets).map(&:first).map(&:key).sort).to eq ["icon", "icon"]
      end
    end
  end
end
