require 'spec_helper'

describe RBattlenet::Wow::Classic::CreatureMedia do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_creature_media" do
    it "fetches creature media data" do
      with_connection("wow_classic_creature_media") do
        result = RBattlenet::Wow::Classic::CreatureMedia.find(382)
        expect(result.assets.size).to be >= 3
      end
    end
  end

  describe "#find_multiple_creature_families" do
    it "fetches creature media data" do
      with_connection("wow_classic_creature_media_multiple") do
        collection = RBattlenet::Wow::Classic::CreatureMedia.find([382, 8871])
        expect(collection.map(&:assets).map(&:first).map(&:key).sort).to eq ["portrait", "portrait"]
      end
    end
  end
end
