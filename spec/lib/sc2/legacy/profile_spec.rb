require 'spec_helper'

describe RBattlenet::Sc2::Legacy::Profile do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_legacy_profile" do
    it "fetches legacy profile data" do
      with_connection("sc2_legacy_profile") do
        result = RBattlenet::Sc2::Legacy::Profile.find(region_id: 2, realm_id: 1, id: 2137104)
        expect(result.displayName).to eq "katarn"
      end
    end
  end

  describe "#find_multiple_legacy_profiles" do
    it "fetches legacy profile data" do
      with_connection("sc2_legacy_profile_multiple") do
        collection = RBattlenet::Sc2::Legacy::Profile.find([
          { region_id: 2, realm_id: 1, id: 2137104 },
          { region_id: 2, realm_id: 1, id: 2137105 },
        ])
        expect(collection.map(&:displayName).sort).to eq ["Shadow", "katarn"]
      end
    end
  end

  describe "#find_legacy_profile_with_multiple_fields" do
    it "fetches legacy profile data" do
      with_connection("sc2_legacy_profile_fields") do
        result = RBattlenet::Sc2::Legacy::Profile.find(
          region_id: 2, realm_id: 1, id: 2137104, fields: [:matches, :ladders]
        )
        expect(result.displayName).to eq "katarn"
        expect(result.matches.first.map).to eq "Bel'Shir Vestige LE"
        expect(result.ladders.currentSeason.class).to eq Array
      end
    end
  end

  describe "#find_multiple_legacy_profiles_with_multiple_fields" do
    it "fetches legacy profile data" do
      with_connection("sc2_legacy_profile_multiple_fields") do
        collection = RBattlenet::Sc2::Legacy::Profile.find([
          { region_id: 2, realm_id: 1, id: 2137104 },
          { region_id: 2, realm_id: 1, id: 2137105 },
        ], fields: [:matches, :ladders])
        expect(collection.map(&:displayName).sort).to eq ["Shadow", "katarn"]
        expect(collection.map(&:matches).map(&:first).map(&:type).sort).to eq ["2v2", "Co-Op"]
        expect(collection.map(&:ladders).map(&:currentSeason).map(&:class)).to eq [Array, Array]
      end
    end
  end
end
