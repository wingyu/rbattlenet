require 'spec_helper'

describe RBattlenet::Wow::PvpTierMedia do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_pvp_tier_media" do
    it "fetches pvp tier media data" do
      with_connection("wow_pvp_tier_media") do
        result = RBattlenet::Wow::PvpTierMedia.find(1)
        expect(result.assets.first.key).to eq "icon"
      end
    end
  end

  describe "#find_multiple_pvp_tier_media" do
    it "fetches pvp tier media data" do
      with_connection("wow_pvp_tier_media_multiple") do
        collection = RBattlenet::Wow::PvpTierMedia.find([1, 2])
        expect(collection.map(&:assets).map(&:size).sort).to eq [1, 1]
      end
    end
  end
end
