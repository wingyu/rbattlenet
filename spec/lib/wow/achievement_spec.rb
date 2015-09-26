require 'spec_helper'

describe RBattlenet::Wow::Achievement do
  before do
    RBattlenet.authenticate(ENV["API"])
    RBattlenet.set_region("us", "en_us")
  end

  describe "#search" do
    it "fetches achievement data" do
      VCR.use_cassette('achievement') do
        achievement = RBattlenet::Wow::Achievement.
          search("2144")

        expect(achievement['points']).to eq 50
      end
    end
  end
end
