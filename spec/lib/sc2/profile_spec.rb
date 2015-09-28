require 'spec_helper'

describe RBattlenet::Sc2::Profile do
  before do
    RBattlenet.authenticate(ENV["API"])
    RBattlenet.set_region("us", "en_US")
  end

  describe "#find" do
    it "fetches profile data" do
      VCR.use_cassette('sc2_profile') do
        profile = RBattlenet::Sc2::Profile.
          find(2137104, 1, 'skt')

        expect(profile['displayName']).to eq "skt"
      end
    end
  end

  describe "#find_ladders" do
    it "fetches ladders data" do
      VCR.use_cassette('sc2_ladders') do
        ladders = RBattlenet::Sc2::Profile.
          find_ladders(2137104, 1, 'skt')
          
        expect(ladders['currentSeason']).to eq []
      end
    end
  end

  describe "#find_match_history" do
    it "fetches match_history data" do
      VCR.use_cassette('sc2_match_history') do
        match_history = RBattlenet::Sc2::Profile.
          find_match_history(2137104, 1, 'skt')
          
        expect(match_history['matches'][0]['map'])
          .to eq 'Airstrike'
      end
    end
  end


end
