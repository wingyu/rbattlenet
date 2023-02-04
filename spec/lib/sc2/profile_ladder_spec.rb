require 'spec_helper'

describe RBattlenet::Sc2::ProfileLadder do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

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
        expect(collection.size).to eq 2
        expect(collection[0].ladderTeams.class).to eq Array
        expect(collection[1].ladderTeams.class).to eq Array
      end
    end
  end
end
