require 'spec_helper'

describe RBattlenet::Wow::Auction do
  before do
    RBattlenet.authenticate(ENV["API"])
    RBattlenet.set_region("us", "en_us")
  end

  describe "#search" do
    context "US region" do
      it "fetches auction data" do
        VCR.use_cassette('auction') do
          auction = RBattlenet::Wow::Auction.
            search("saurfang")

          expect(auction['files'].count).to eq 1
        end
      end
    end
  end
end
