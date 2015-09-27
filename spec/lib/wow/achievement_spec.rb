require 'spec_helper'

describe RBattlenet::Wow::Achievement do
  before do
    RBattlenet.authenticate(ENV["API"])
    RBattlenet.set_region("us", "en_us")
  end

  describe "#find" do
    it "fetches achievement data" do
      VCR.use_cassette('wow_achievement') do
        achievement = RBattlenet::Wow::Achievement.
          find("2144")

        expect(achievement['points']).to eq 50
      end
    end
  end
end
