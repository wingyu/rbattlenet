require 'spec_helper'

describe RBattlenet::D3::Era do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_era" do
    it "fetches era data" do
      with_connection("d3_era") do
        result = RBattlenet::D3::Era.find(1)
        expect(result.leaderboard.size).to be >= 18
      end
    end
  end

  describe "#find_multiple_eras" do
    it "fetches era data" do
      with_connection("d3_era_multiple") do
        collection = RBattlenet::D3::Era.find([1, 2])
        expect(collection.map(&:leaderboard).map(&:size).sort).to eq [18, 18]
      end
    end
  end

  describe "#find_all_eras" do
    it "fetches all era data" do
      with_connection("d3_era_all") do
        result = RBattlenet::D3::Era.all
        expect(result.era.size).to be >= 12
      end
    end
  end
end
