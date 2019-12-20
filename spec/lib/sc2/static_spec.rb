require 'spec_helper'

describe RBattlenet::Sc2::Static do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_static" do
    it "fetches static profile data" do
      with_connection("sc2_static") do
        result = RBattlenet::Sc2::Static.find(2)
        expect(result.achievements.size).to be >= 2549
      end
    end
  end

  describe "#find_multiple_static" do
    it "fetches static profile data" do
      with_connection("sc2_static_multiple") do
        collection = RBattlenet::Sc2::Static.find([1, 2])
        expect(collection.results.map(&:achievements).map(&:size).sort).to eq [2549, 2549]
      end
    end
  end
end
