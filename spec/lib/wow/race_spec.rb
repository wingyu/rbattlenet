require 'spec_helper'

describe RBattlenet::Wow::Race do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_race" do
    it "fetches race data" do
      with_connection("wow_race") do
        result = RBattlenet::Wow::Race.find(2)
        expect(result.name).to eq "Orc"
      end
    end
  end

  describe "#find_multiple_races" do
    it "fetches race data" do
      with_connection("wow_race_multiple") do
        collection = RBattlenet::Wow::Race.find([2, 3])
        expect(collection.results.map(&:name).sort).to eq ["Dwarf", "Orc"]
      end
    end
  end

  describe "#find_all_races" do
    it "fetches all race data" do
      with_connection("wow_race_all") do
        result = RBattlenet::Wow::Race.all
        expect(result.races.size).to eq 25
      end
    end
  end
end
