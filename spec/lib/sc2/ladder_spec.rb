require 'spec_helper'

describe RBattlenet::Sc2::Profile do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
    RBattlenet.set_region(region: "us", locale: "en_US")
  end

  describe "#find" do
    it "fetches ladder data" do
      VCR.use_cassette('sc2_ladder') do
        ladder = RBattlenet::Sc2::Ladder.
          find(id: 2200, region_id: 1)

        expect(ladder['ladderMembers'][0]['joinTimestamp'])
          .to eq 1298162744
      end
    end
  end
end
