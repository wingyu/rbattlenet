require 'spec_helper'

describe RBattlenet::Wow::CreatureMedia, type: :game_data do

  describe "#find_creature_media" do
    it "fetches creature media data" do
      with_connection("wow_creature_media") do
        result = RBattlenet::Wow::CreatureMedia.find(30221)
        expect(result.assets.size).to be >= 3
      end
    end
  end

  describe "#find_multiple_creature_families" do
    it "fetches creature media data" do
      with_connection("wow_creature_media_multiple") do
        collection = RBattlenet::Wow::CreatureMedia.find([30221, 30222])
        expect(collection.results.map(&:assets).map(&:first).map(&:key).sort).to eq ["portrait", "portrait"]
      end
    end
  end
end
