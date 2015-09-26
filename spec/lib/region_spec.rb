require 'spec_helper'

describe "non-US region and locale functionality" do
  before do
    RBattlenet.authenticate(ENV["API"])
    RBattlenet.set_region("us", "en_us")
  end

  context "Find character" do
    it "fetches non-us based character data" do
      VCR.use_cassette('character_eu') do
        RBattlenet.set_region("eu", "en_GB")
        character = RBattlenet::Wow::Character.
          find("madfrogz", "outland")

        expect(character['level']).to eq 100
      end
    end
  end
end
