require 'spec_helper'

describe RBattlenet::Wow::PvpTier do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_pvp_tier" do
    it "fetches pvp tier data" do
      with_connection("wow_pvp_tier") do
        result = RBattlenet::Wow::PvpTier.find(1)
        expect(result.name).to eq "Unranked"
      end
    end
  end

  describe "#find_multiple_pvp_tiers" do
    it "fetches pvp tier data" do
      with_connection("wow_pvp_tier_multiple") do
        collection = RBattlenet::Wow::PvpTier.find([1, 2])
        expect(collection.map(&:name).sort).to eq ["Combatant", "Unranked"]
      end
    end
  end

  describe "#find_all_pvp_tiers" do
    it "fetches all pvp tier data" do
      with_connection("wow_pvp_tier_all") do
        result = RBattlenet::Wow::PvpTier.all
        expect(result.tiers.size).to eq 18
      end
    end
  end
end
