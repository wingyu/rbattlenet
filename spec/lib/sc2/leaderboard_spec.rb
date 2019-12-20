require 'spec_helper'

describe RBattlenet::Sc2::Leaderboard do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_leaderboard" do
    it "fetches leaderboard profile data" do
      with_connection("sc2_leaderboard") do
        result = RBattlenet::Sc2::Leaderboard.find(2)
        expect(result.ladderTeams.size).to be >= 195
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
