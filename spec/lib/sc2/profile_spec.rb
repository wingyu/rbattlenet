require 'spec_helper'

describe RBattlenet::Sc2::Profile do
  before do
    RBattlenet.authenticate(api_key: ENV["API"])
    RBattlenet.set_region(region: "us", locale: "en_US")
  end

  describe "#find" do
    it "fetches profile data" do
      VCR.use_cassette('sc2_profile') do
        profile = RBattlenet::Sc2::Profile.
          find(id: 2137104, region: 1, name: 'skt')

        expect(profile['displayName']).to eq "skt"
      end
    end
  end

  describe "#find_ladders" do
    it "fetches ladders data" do
      VCR.use_cassette('sc2_profile_ladders') do
        ladders = RBattlenet::Sc2::Profile.
          find_ladders(id: 2137104, region: 1, name: 'skt')
          
        expect(ladders['currentSeason']).to eq []
      end
    end
  end

  describe "#find_match_history" do
    it "fetches match_history data" do
      VCR.use_cassette('sc2_profile_match_history') do
        match_history = RBattlenet::Sc2::Profile.
          find_match_history(id: 2137104, region: 1, name: 'skt')
          
        expect(match_history['matches'][0]['map'])
          .to eq 'Airstrike'
      end
    end
  end


end
