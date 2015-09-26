require 'spec_helper'

describe "non-US region and locale functionality" do
  before do
    RBattlenet.authenticate(ENV["API"])
    RBattlenet.set_region("us", "en_us")
  end

  context "Character search" do
    it "fetches character data" do
      VCR.use_cassette('character_eu') do
        RBattlenet.set_region("eu", "en_GB")
        character = RBattlenet::Wow::Character.
          search("madfrogz", "outland")

        expect(character['level']).to eq 100
      end
    end
  end
end
