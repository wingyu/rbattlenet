require 'spec_helper'

describe "non-US region and locale functionality" do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
    RBattlenet.set_region(region: "us", locale: "en_us")
  end

  context "Find character" do
    it "fetches non-us based character data" do
      VCR.use_cassette('character_eu') do
        RBattlenet.set_region(region: "eu", locale: "en_GB")
        character = RBattlenet::Wow::Character.
          find(name: "madfrogz", realm: "outland")

        expect(character['level']).to eq 120
      end
    end
  end
end
