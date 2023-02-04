require 'spec_helper'

describe RBattlenet::Wow::ItemClass do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_item_class" do
    it "fetches item class data" do
      with_connection("wow_item_class") do
        result = RBattlenet::Wow::ItemClass.find(1)
        expect(result.name).to eq "Container"
      end
    end
  end

  describe "#find_multiple_item_classes" do
    it "fetches item class data" do
      with_connection("wow_item_class_multiple") do
        collection = RBattlenet::Wow::ItemClass.find([1, 2])
        expect(collection.map(&:name).sort).to eq ["Container", "Weapon"]
      end
    end
  end

  describe "#find_all_item_classes" do
    it "fetches all item class data" do
      with_connection("wow_item_class_all") do
        result = RBattlenet::Wow::ItemClass.all
        expect(result.item_classes.size).to be >= 12
      end
    end
  end
end
