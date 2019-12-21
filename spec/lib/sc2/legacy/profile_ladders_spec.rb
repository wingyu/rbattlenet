require 'spec_helper'

describe RBattlenet::Sc2::Legacy::ProfileLadders do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_legacy_profile_ladders" do
    it "fetches legacy profile ladders data" do
      with_connection("sc2_legacy_profile_ladders") do
        result = RBattlenet::Sc2::Legacy::ProfileLadders.find(region_id: 2, realm_id: 1, id: 2137104)
        expect(result.currentSeason.class).to eq Array
      end
    end
  end

  describe "#find_multiple_legacy_profile_ladderss" do
    it "fetches legacy profile ladders data" do
      with_connection("sc2_legacy_profile_ladders_multiple") do
        collection = RBattlenet::Sc2::Legacy::ProfileLadders.find([
          { region_id: 2, realm_id: 1, id: 2137104 },
          { region_id: 2, realm_id: 1, id: 2137105 },
        ])
        expect(collection.results.map(&:currentSeason).map(&:class).sort).to eq [Array, Array]
      end
    end
  end
end
