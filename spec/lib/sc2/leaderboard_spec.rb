require 'spec_helper'

describe RBattlenet::Sc2::Leaderboard, type: :community do

  describe "#find_leaderboard" do
    it "fetches leaderboard profile data" do
      with_connection("sc2_leaderboard") do
        result = RBattlenet::Sc2::Leaderboard.find(2)
        expect(result.ladderTeams.size).to be >= 100
      end
    end
  end

  describe "#find_multiple_leaderboard" do
    it "fetches leaderboard profile data" do
      with_connection("sc2_leaderboard_multiple") do
        collection = RBattlenet::Sc2::Leaderboard.find([1, 2])
        expect(collection.results.map(&:ladderTeams).map(&:class)).to eq [Array, Array]
      end
    end
  end
end
