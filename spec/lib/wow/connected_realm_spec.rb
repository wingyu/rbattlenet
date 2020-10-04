require 'spec_helper'

describe RBattlenet::Wow::ConnectedRealm, type: :game_data do

  describe "#find_connected_realm" do
    it "fetches connected realm data" do
      with_connection("wow_connected_realm") do
        result = RBattlenet::Wow::ConnectedRealm.find(509)
        expect(result.realms.first.name).to eq "Garona"
      end
    end
  end

  describe "#find_multiple_connected_realms" do
    it "fetches connected realm data" do
      with_connection("wow_connected_realm_multiple") do
        collection = RBattlenet::Wow::ConnectedRealm.find([509, 510])
        expect(collection.results.map(&:realms).map(&:first).map(&:name).sort).to eq [
          "Garona", "Vol'jin"
        ]
      end
    end
  end

  describe "#find_all_connected_realms" do
    it "fetches all connected realm data" do
      with_connection("wow_connected_realm_all") do
        result = RBattlenet::Wow::ConnectedRealm.all
        expect(result.connected_realms.size).to be >= 21
      end
    end
  end
end
