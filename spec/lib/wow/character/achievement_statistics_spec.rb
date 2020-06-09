require 'spec_helper'

describe RBattlenet::Wow::Character::AchievementStatistics do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_character_achievement_statistics" do
    it "fetches character data" do
      with_connection("wow_character_achievement_statistics") do
        result = RBattlenet::Wow::Character::AchievementStatistics.find(realm: "stormrage", name: "sheday")
        expect(result.statistics.class).to eq Array
      end
    end
  end

  describe "#find_multiple_character_achievement_statisticss" do
    it "fetches character data" do
      with_connection("wow_character_achievement_statistics_multiple") do
        collection = RBattlenet::Wow::Character::AchievementStatistics.find([
          { realm: "stormrage", name: "sheday" },
          { realm: "howling-fjord", name: "альвеоняша" },
        ])
        expect(collection.results.map(&:statistics).map(&:class)).to eq [Array, Array]
      end
    end
  end
end
