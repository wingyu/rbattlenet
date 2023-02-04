require 'spec_helper'

describe RBattlenet::Wow::PlayableClassMedia do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_playable_class_media" do
    it "fetches playable class media data" do
      with_connection("wow_playable_class_media") do
        result = RBattlenet::Wow::PlayableClassMedia.find(1)
        expect(result.assets.size).to be >= 1
      end
    end
  end

  describe "#find_multiple_playable_class_media" do
    it "fetches playable class media data" do
      with_connection("wow_playable_class_media_multiple") do
        collection = RBattlenet::Wow::PlayableClassMedia.find([1, 2])
        expect(collection.map(&:assets).map(&:first).map(&:key).sort).to eq ["icon", "icon"]
      end
    end
  end
end
