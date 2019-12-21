require 'spec_helper'

describe RBattlenet::D3::Hero::Items do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_hero_items" do
    it "fetches hero items data" do
      with_connection("d3_hero_items") do
        result = RBattlenet::D3::Hero::Items.find(battletag: "FaYe-2543", id: 104729462)
        expect(result.head.name).to eq "Pestilence Mask"
      end
    end
  end
end
