require 'spec_helper'

describe RBattlenet::Wow::Achievement do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
    RBattlenet.set_region(region: "us", locale: "en_us")
  end

  describe "#find" do
    it "fetches achievement data" do
      VCR.use_cassette('wow_achievement') do
        achievement = RBattlenet::Wow::Achievement.
          find(id: 2144)

        expect(achievement['points']).to eq 50
      end
    end
  end
end
