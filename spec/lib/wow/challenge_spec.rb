require 'spec_helper'

describe RBattlenet::Wow::Challenge do
  before do
    RBattlenet.authenticate(ENV["API"])
    RBattlenet.set_region("us", "en_us")
  end

  describe "#search_realm" do
    it "fetches realm leaderboard data" do
      VCR.use_cassette('challenge_realm') do
        realm_leaderboard = RBattlenet::Wow::Challenge.
          search_realm("saurfang")

        expect(realm_leaderboard['challenge'].count).to eq 17
      end
    end
  end

  describe "#search_region" do
    it "fetches region leaderboard data" do
      VCR.use_cassette('challenge_region') do
        region_leaderboard = RBattlenet::Wow::Challenge.
          search_region

        expect(region_leaderboard['challenge'].count).to eq 17
      end
    end
  end
end
