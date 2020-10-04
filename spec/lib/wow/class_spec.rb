require 'spec_helper'

describe RBattlenet::Wow::Class do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_class" do
    it "fetches class data" do
      with_connection("wow_class") do
        result = RBattlenet::Wow::Class.find(8)
        expect(result.name).to eq "Mage"
      end
    end
  end

  describe "#find_multiple_classs" do
    it "fetches class data" do
      with_connection("wow_class_multiple") do
        collection = RBattlenet::Wow::Class.find([5, 8])
        expect(collection.results.map(&:name).sort).to eq ["Mage", "Priest"]
      end
    end
  end

  describe "#find_all_classs" do
    it "fetches all class data" do
      with_connection("wow_class_all") do
        result = RBattlenet::Wow::Class.all
        expect(result.classes.size).to eq 12
      end
    end
  end
end
