require 'spec_helper'

describe RBattlenet::Wow::Classic::PlayableClass do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_playable_class" do
    it "fetches playable class data" do
      with_connection("wow_classic_playable_class") do
        result = RBattlenet::Wow::Classic::PlayableClass.find(1)
        expect(result.name).to eq "Warrior"
      end
    end
  end

  describe "#find_multiple_playable_classes" do
    it "fetches playable class data" do
      with_connection("wow_classic_playable_class_multiple") do
        collection = RBattlenet::Wow::Classic::PlayableClass.find([1, 2])
        expect(collection.map(&:name).sort).to eq ["Paladin", "Warrior"]
      end
    end
  end

  describe "#find_all_playable_classes" do
    it "fetches all playable class data" do
      with_connection("wow_classic_playable_class_all") do
        result = RBattlenet::Wow::Classic::PlayableClass.all
        expect(result.classes.size).to be >= 9
      end
    end
  end
end
