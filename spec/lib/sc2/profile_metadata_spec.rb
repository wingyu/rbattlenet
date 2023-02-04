require 'spec_helper'

describe RBattlenet::Sc2::ProfileMetadata do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_profile_metadata" do
    it "fetches profile metadata" do
      with_connection("sc2_profile_metadata") do
        result = RBattlenet::Sc2::ProfileMetadata.find(region_id: 2, realm_id: 1, id: 2137104)
        expect(result.profileUrl).to eq "https://www.starcraft2.com/profile/2/1/2137104"
      end
    end
  end

  describe "#find_multiple_profiles_metadata" do
    it "fetches profile metadata" do
      with_connection("sc2_profile_metadata_multiple") do
        collection = RBattlenet::Sc2::ProfileMetadata.find([
          { region_id: 2, realm_id: 1, id: 2137104 },
          { region_id: 2, realm_id: 1, id: 2137105 },
        ])
        expect(collection.size).to eq 2
        expect(collection[0].profileUrl).to eq "https://www.starcraft2.com/profile/2/1/2137104"
        expect(collection[1].profileUrl).to eq "https://www.starcraft2.com/profile/2/1/2137105"
      end
    end
  end
end
