require 'spec_helper'

describe "non-US region and locale functionality" do
  before do
    RBattlenet.authenticate(api_key: ENV["API"])
    RBattlenet.set_region(region: "us", locale: "en_us")
  end

  context "Find character" do
    it "fetches non-us based character data" do
      VCR.use_cassette('character_eu') do
        RBattlenet.set_region(region: "eu", locale: "en_GB")
        character = RBattlenet::Wow::Character.
          find(name: "madfrogz", realm: "outland")

        expect(character['level']).to eq 100
      end
    end
  end
end
