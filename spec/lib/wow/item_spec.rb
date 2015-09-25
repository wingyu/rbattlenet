require 'spec_helper'

describe RBattlenet::Wow::Item do
  before do
    RBattlenet.authenticate(ENV["API"])
    RBattlenet.set_region("us", "en_us")
  end

  describe "#search_item" do
    it "fetches item data" do
      VCR.use_cassette('item') do
        item = RBattlenet::Wow::Item.
          search_item(18803)

        expect(item['name']).to eq "Finkle's Lava Dredger"
      end
    end
  end

  describe "#search_item_set" do
    it "fetches item set data" do
      VCR.use_cassette('item_set') do
        item_set = RBattlenet::Wow::Item.
          search_item_set(1060)

        expect(item_set["name"]).to eq "Deep Earth Vestments"
      end
    end
  end
end
