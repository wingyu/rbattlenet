require 'spec_helper'

describe RBattlenet::Wow::Item do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_item" do
    it "fetches item data" do
      with_connection("wow_item") do
        item = RBattlenet::Wow::Item.find(18803)
        expect(item.name).to eq "Finkle's Lava Dredger"
      end
    end
  end

  describe "#find_multiple_items" do
    it "fetches item data" do
      with_connection("wow_item") do
        collection = RBattlenet::Wow::Item.find([18803, 18804])
        expect(collection.results.map(&:name).sort).to eq ["Finkle's Lava Dredger", "Lord Grayson's Satchel"]
      end
    end
  end
end
