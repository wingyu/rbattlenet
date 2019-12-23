require 'spec_helper'

describe RBattlenet::Sc2::ProfileLadderSummary do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_profile_ladder_summary" do
    it "fetches profile ladder summary data" do
      with_connection("sc2_profile_ladder_summary") do
        result = RBattlenet::Sc2::ProfileLadderSummary.find(region_id: 2, realm_id: 1, id: 2137104)
        expect(result.allLadderMemberships.class).to eq Array
      end
    end
  end

  describe "#find_multiple_profile_ladder_summaries" do
    it "fetches profile ladder summary data" do
      with_connection("sc2_profile_ladder_summary_multiple") do
        collection = RBattlenet::Sc2::ProfileLadderSummary.find([
          { region_id: 2, realm_id: 1, id: 2137104 },
          { region_id: 2, realm_id: 1, id: 2137105 },
        ])
        expect(collection.results.size).to eq 2
        expect(collection.results[0].allLadderMemberships.class).to eq Array
        expect(collection.results[1].allLadderMemberships.class).to eq Array
      end
    end
  end
end
