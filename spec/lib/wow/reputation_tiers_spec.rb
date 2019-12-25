require 'spec_helper'

describe RBattlenet::Wow::ReputationTiers do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_reputation_tier" do
    it "fetches reputation tier data" do
      with_connection("wow_reputation_tier") do
        result = RBattlenet::Wow::ReputationTiers.find(2)
        expect(result.tiers.first.name).to eq "Stranger"
      end
    end
  end

  describe "#find_multiple_reputation_tiers" do
    it "fetches reputation tier data" do
      with_connection("wow_reputation_tier_multiple") do
        collection = RBattlenet::Wow::ReputationTiers.find([2, 22])
        expect(collection.results.map(&:tiers).map(&:first).map(&:name).sort).to eq ["Stranger", "Stranger"]
      end
    end
  end

  describe "#find_all_reputation_tiers" do
    it "fetches all reputation tier data" do
      with_connection("wow_reputation_tier_all") do
        result = RBattlenet::Wow::ReputationTiers.all
        expect(result.reputation_tiers.size).to be >= 37
      end
    end
  end
end
