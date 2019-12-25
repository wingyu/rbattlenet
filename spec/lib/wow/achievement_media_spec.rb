require 'spec_helper'

describe RBattlenet::Wow::AchievementMedia do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_achievement_media" do
    it "fetches achievement media data" do
      with_connection("wow_achievement_media") do
        result = RBattlenet::Wow::AchievementMedia.find(6)
        expect(result.assets.size).to be >= 1
      end
    end
  end

  describe "#find_multiple_achievement_media" do
    it "fetches achievement media data" do
      with_connection("wow_achievement_media_multiple") do
        collection = RBattlenet::Wow::AchievementMedia.find([6, 7])
        expect(collection.results.map(&:assets).map(&:first).map(&:key).sort).to eq ["icon", "icon"]
      end
    end
  end
end
