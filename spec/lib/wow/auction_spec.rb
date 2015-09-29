require 'spec_helper'

describe RBattlenet::Wow::Auction do
  before do
    RBattlenet.authenticate(api_key: ENV["API"])
    RBattlenet.set_region(region: "us", locale: "en_us")
  end

  describe "#find" do
    it "fetches auction data" do
      VCR.use_cassette('wow_auction') do
        auction = RBattlenet::Wow::Auction.
          find(realm: "saurfang")

        expect(auction['files'].count).to eq 1
      end
    end
  end
end
