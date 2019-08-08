require 'spec_helper'

describe RBattlenet::Sc2::Profile do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
    RBattlenet.set_region(region: "us", locale: "en_US")
  end

  describe "#find" do
    xit "fetches profile data" do
      VCR.use_cassette('sc2_profile') do
        profile = RBattlenet::Sc2::Profile.
          find(profile_id: 1235050, region: 1, realm: 1)

        expect(profile['displayName']).to eq "skt"
      end
    end
  end

  describe "#find_ladders" do
    it "fetches ladders data" do
      VCR.use_cassette('sc2_profile_ladders') do
        ladders = RBattlenet::Sc2::Profile.
          find_ladders(id: 2137104, region: 1, realm: 1)
          
        expect(ladders['currentSeason']).to eq []
      end
    end
  end

  describe "#find_match_history" do
    it "fetches match_history data" do
      VCR.use_cassette('sc2_profile_match_history') do
        match_history = RBattlenet::Sc2::Profile.
          find_match_history(id: 2137104, region: 1, realm: 1)
          
        expect(match_history['matches'][0]['map'])
          .to eq 'Airstrike'
      end
    end
  end


end
