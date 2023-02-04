require 'spec_helper'

describe RBattlenet::Wow::Classic::ItemSubclass do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_item_subclass" do
    it "fetches item subclass data" do
      with_connection("wow_classic_item_subclass") do
        result = RBattlenet::Wow::Classic::ItemSubclass.find(class_id: 0, id: 0)
        expect(result.display_name).to eq "Consumable"
      end
    end
  end

  describe "#find_multiple_item_subclasss" do
    it "fetches item subclass data" do
      with_connection("wow_classic_item_subclass_multiple") do
        collection = RBattlenet::Wow::Classic::ItemSubclass.find([
          { class_id: 0, id: 0 },
          { class_id: 1, id: 0 },
        ])
        expect(collection.map(&:display_name).sort).to eq ["Bag", "Consumable"]
      end
    end
  end
end
