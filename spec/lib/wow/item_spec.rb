require 'spec_helper'

describe RBattlenet::Wow::Item do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
    RBattlenet.set_region(region: "us", locale: "en_us")
  end

  describe "#find_item" do
    it "fetches item data" do
      VCR.use_cassette('wow_item') do
        item = RBattlenet::Wow::Item.
          find(id: 18803)

        expect(item['name']).to eq "Finkle's Lava Dredger"
      end
    end
  end

  describe "#find_item_set" do
    it "fetches item set data" do
      VCR.use_cassette('wow_item_set') do
        item_set = RBattlenet::Wow::Item.
          find_set(id: 1060)

        expect(item_set["name"]).to eq "Deep Earth Vestments"
      end
    end
  end
end
