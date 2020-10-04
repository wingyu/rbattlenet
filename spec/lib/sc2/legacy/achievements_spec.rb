require 'spec_helper'

describe RBattlenet::Sc2::Legacy::Achievements, type: :community do

  describe "#find_achievements" do
    it "fetches achievements data" do
      with_connection("sc2_legacy_achievements") do
        result = RBattlenet::Sc2::Legacy::Achievements.find(2)
        expect(result.achievements.size).to be >= 1293
      end
    end
  end

  describe "#find_multiple_achievements" do
    it "fetches achievements profile data" do
      with_connection("sc2_legacy_achievements_multiple") do
        collection = RBattlenet::Sc2::Legacy::Achievements.find([1, 2])
        expect(collection.results.map(&:achievements).map(&:size).sort).to eq [1293, 1293]
      end
    end
  end
end
