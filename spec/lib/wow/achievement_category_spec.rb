require 'spec_helper'

describe RBattlenet::Wow::AchievementCategory do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_achievement_category" do
    it "fetches achievement category data" do
      with_connection("wow_achievement_category") do
        result = RBattlenet::Wow::AchievementCategory.find(81)
        expect(result.name).to eq "Feats of Strength"
      end
    end
  end

  describe "#find_multiple_achievement_categories" do
    it "fetches achievement category data" do
      with_connection("wow_achievement_category_multiple") do
        collection = RBattlenet::Wow::AchievementCategory.find([81, 92])
        expect(collection.map(&:name).sort).to eq ["Character", "Feats of Strength"]
      end
    end
  end

  describe "#find_all_achievement_categories" do
    it "fetches all achievement category data" do
      with_connection("wow_achievement_category_all") do
        result = RBattlenet::Wow::AchievementCategory.all
        expect(result.categories.size).to be >= 113
      end
    end
  end
end
