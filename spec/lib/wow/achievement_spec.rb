require 'spec_helper'

describe RBattlenet::Wow::Achievement do
  before do
    RBattlenet.authenticate(ENV["API"])
    RBattlenet.set_region("us", "en_us")
  end

  describe "#search" do
    context "US region" do
      it "fetches achievement data" do
        VCR.use_cassette('achievement_2144') do
          achievement = RBattlenet::Wow::Achievement.
            search("2144")

          expect(achievement['points']).to eq 50
        end
      end
    end

    context "non-US region" do
      it "fetches achievement data" do
        VCR.use_cassette('achievement_eu_2144') do
          RBattlenet.set_region("eu", "en_GB")
          achievement = RBattlenet::Wow::Achievement.
            search("2144")

          expect(achievement['points']).to eq 50
        end
      end
    end
  end
end
