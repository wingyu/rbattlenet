require 'spec_helper'

describe RBattlenet::Wow::ItemSubclass do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_item_subclass" do
    it "fetches item subclass data" do
      with_connection("wow_item_subclass") do
        result = RBattlenet::Wow::ItemSubclass.find(class_id: 0, id: 0)
        expect(result.display_name).to eq "Explosives and Devices"
      end
    end
  end

  describe "#find_multiple_item_subclasss" do
    it "fetches item subclass data" do
      with_connection("wow_item_subclass_multiple") do
        collection = RBattlenet::Wow::ItemSubclass.find([
          { class_id: 0, id: 0 },
          { class_id: 1, id: 0 },
        ])
        expect(collection.results.map(&:display_name).sort).to eq ["Bag", "Explosives and Devices"]
      end
    end
  end
end
