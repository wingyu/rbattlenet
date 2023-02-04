require 'spec_helper'

describe RBattlenet::Sc2::Profile do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_profile" do
    it "fetches profile data" do
      with_connection("sc2_profile") do
        result = RBattlenet::Sc2::Profile.find(region_id: 2, realm_id: 1, id: 2137104)
        expect(result.summary.displayName).to eq "katarn"
      end
    end
  end

  describe "#find_multiple_profiles" do
    it "fetches profile data" do
      with_connection("sc2_profile_multiple") do
        collection = RBattlenet::Sc2::Profile.find([
          { region_id: 2, realm_id: 1, id: 2137104 },
          { region_id: 2, realm_id: 1, id: 2137105 },
        ])
        expect(collection.size).to eq 2
        expect(collection.map(&:summary).map(&:displayName).sort).to eq ["Shadow", "katarn"]
      end
    end
  end
end
