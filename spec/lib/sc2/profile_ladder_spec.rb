require 'spec_helper'

describe RBattlenet::Sc2::ProfileLadder, type: :community do

  describe "#find_profile_ladder" do
    it "fetches profile ladder data" do
      with_connection("sc2_profile_ladder") do
        result = RBattlenet::Sc2::ProfileLadder.find(region_id: 2, realm_id: 1, profile_id: 2137104, id: 2200)
        expect(result.ladderTeams.class).to eq Array
      end
    end
  end

  describe "#find_multiple_profile_ladders" do
    it "fetches profile ladder data" do
      with_connection("sc2_profile_ladder_multiple") do
        collection = RBattlenet::Sc2::ProfileLadder.find([
          { region_id: 2, realm_id: 1, profile_id: 2137104, id: 2200 },
          { region_id: 2, realm_id: 1, profile_id: 2137105, id: 2200 },
        ])
        expect(collection.results.size).to eq 2
        expect(collection.results[0].ladderTeams.class).to eq Array
        expect(collection.results[1].ladderTeams.class).to eq Array
      end
    end
  end
end
