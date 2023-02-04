require 'spec_helper'

describe RBattlenet::Sc2::Legacy::ProfileMatchHistory do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_legacy_profile_match_history" do
    it "fetches legacy profile match history data" do
      with_connection("sc2_legacy_profile_match_history") do
        result = RBattlenet::Sc2::Legacy::ProfileMatchHistory.find(region_id: 2, realm_id: 1, id: 2137104)
        expect(result.matches.class).to eq Array
      end
    end
  end

  describe "#find_multiple_legacy_profile_match_historys" do
    it "fetches legacy profile match history data" do
      with_connection("sc2_legacy_profile_match_history_multiple") do
        collection = RBattlenet::Sc2::Legacy::ProfileMatchHistory.find([
          { region_id: 2, realm_id: 1, id: 2137104 },
          { region_id: 2, realm_id: 1, id: 2137105 },
        ])
        expect(collection.map(&:matches).map(&:class).sort).to eq [Array, Array]
      end
    end
  end
end
