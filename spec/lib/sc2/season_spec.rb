require 'spec_helper'

describe RBattlenet::Sc2::Season do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_season" do
    it "fetches season profile data" do
      with_connection("sc2_season") do
        result = RBattlenet::Sc2::Season.find(2)
        expect(result.startDate).to eq "1574819530"
      end
    end
  end

  describe "#find_multiple_season" do
    it "fetches season profile data" do
      with_connection("sc2_season_multiple") do
        collection = RBattlenet::Sc2::Season.find([1, 2])
        expect(collection.results.map(&:startDate).sort).to eq ["1574796158", "1574819530"]
      end
    end
  end
end
