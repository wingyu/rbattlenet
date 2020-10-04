require 'spec_helper'

describe RBattlenet::Wow::Achievement, type: :game_data do

  describe "#find_achievement" do
    it "fetches achievement data" do
      with_connection("wow_achievement") do
        result = RBattlenet::Wow::Achievement.find(6)
        expect(result.name).to eq "Level 10"
      end
    end
  end

  describe "#find_multiple_achievements" do
    it "fetches achievement data" do
      with_connection("wow_achievement_multiple") do
        collection = RBattlenet::Wow::Achievement.find([6, 7])
        expect(collection.results.map(&:name).sort).to eq ["Level 10", "Level 20"]
      end
    end
  end

  describe "#find_all_achievements" do
    it "fetches all achievement data" do
      with_connection("wow_achievement_all") do
        result = RBattlenet::Wow::Achievement.all
        expect(result.achievements.size).to be >= 5034
      end
    end
  end
end
