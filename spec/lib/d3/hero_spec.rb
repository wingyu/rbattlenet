require 'spec_helper'

describe RBattlenet::D3::Hero do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_hero" do
    it "fetches hero data" do
      with_connection("d3_hero") do
        result = RBattlenet::D3::Hero.find(battletag: "FaYe-2543", id: 104729462)
        expect(result.name).to eq "BITCONNEEECT"
      end
    end
  end

  describe "#find_hero_with_multiple_fields" do
    it "fetches hero data" do
      with_connection("d3_hero_fields") do
        result = RBattlenet::D3::Hero.find(battletag: "FaYe-2543", id: 104729462, fields: [:items, :follower_items])
        expect(result.name).to eq "BITCONNEEECT"
        expect(result.follower_items.templar.neck.name).to eq "The Ess of Johan"
        expect(result.items.head.name).to eq "Pestilence Mask"
      end
    end
  end
end
