require 'spec_helper'

describe RBattlenet::Sc2::Legacy::Rewards do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_rewards" do
    it "fetches rewards data" do
      with_connection("sc2_legacy_rewards") do
        result = RBattlenet::Sc2::Legacy::Rewards.find(2)
        expect(result.portraits.size).to be >= 549
      end
    end
  end

  describe "#find_multiple_rewards" do
    it "fetches rewards profile data" do
      with_connection("sc2_legacy_rewards_multiple") do
        collection = RBattlenet::Sc2::Legacy::Rewards.find([1, 2])
        expect(collection.map(&:portraits).map(&:size).sort).to eq [549, 549]
      end
    end
  end
end
