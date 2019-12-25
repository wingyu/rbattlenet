require 'spec_helper'

describe RBattlenet::Wow::Classic::PlayableClassMedia do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_playable_class_media" do
    it "fetches playable class media data" do
      with_connection("wow_classic_playable_class_media") do
        result = RBattlenet::Wow::Classic::PlayableClassMedia.find(7)
        expect(result.status_code).to be 200
      end
    end
  end

  describe "#find_multiple_playable_class_media" do
    it "fetches playable class media data" do
      with_connection("wow_classic_playable_class_media_multiple") do
        collection = RBattlenet::Wow::Classic::PlayableClassMedia.find([7, 8])
        expect(collection.results.map(&:status_code)).to eq [200, 200]
      end
    end
  end
end
