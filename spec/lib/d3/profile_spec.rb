require 'spec_helper'

describe RBattlenet::D3::Profile do
  before do
    RBattlenet.authenticate(ENV["API"])
    RBattlenet.set_region("eu", "en_GB")
  end

  describe "#find_career" do
    it "fetches career data" do
      VCR.use_cassette('profile_career') do
        career = RBattlenet::D3::Profile.
          find_career("FaYe-2543")

        expect(career['guildName']).to eq "NoUnburiedLeftBehind"
      end
    end
  end
end
