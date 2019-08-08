require 'spec_helper'

describe RBattlenet::D3::Profile do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
    RBattlenet.set_region(region: "eu", locale: "en_GB")
  end

  describe "#find_career" do
    it "fetches career data" do
      VCR.use_cassette('d3_profile_career') do
        career = RBattlenet::D3::Profile.
          find_career(battletag: "FaYe-2543")

        expect(career['guildName']).to eq "NoUnburiedLeftBehind"
      end
    end
  end

  describe "#find_hero" do
    it "fetches hero data" do
      VCR.use_cassette('d3_profile_hero') do
        hero = RBattlenet::D3::Profile.
          find_hero(battletag: "FaYe-2543", id: 104729462)

        expect(hero['class']).to eq "necromancer"
      end
    end
  end
end
