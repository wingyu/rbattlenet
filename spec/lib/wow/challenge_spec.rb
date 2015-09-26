require 'spec_helper'

describe RBattlenet::Wow::Challenge do
  before do
    RBattlenet.authenticate(ENV["API"])
    RBattlenet.set_region("us", "en_us")
  end

  describe "#find_realm" do
    it "fetches realm leaderboard data" do
      VCR.use_cassette('challenge_realm') do
        realm_leaderboard = RBattlenet::Wow::Challenge.
          find_realm("saurfang")

        expect(realm_leaderboard['challenge'].count).to eq 17
      end
    end
  end

  describe "#find_region" do
    it "fetches region leaderboard data" do
      VCR.use_cassette('challenge_region') do
        region_leaderboard = RBattlenet::Wow::Challenge.
          find_region

        expect(region_leaderboard['challenge'].count).to eq 17
      end
    end
  end
end
