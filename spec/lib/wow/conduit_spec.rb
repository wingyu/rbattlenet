require 'spec_helper'

describe RBattlenet::Wow::Conduit do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_conduit" do
    it "fetches conduit data" do
      with_connection("wow_conduit") do
        result = RBattlenet::Wow::Conduit.find(39)
        expect(result.name).to eq "Gift of the Lich"
      end
    end
  end

  describe "#find_multiple_conduits" do
    it "fetches conduit data" do
      with_connection("wow_conduit_multiple") do
        collection = RBattlenet::Wow::Conduit.find([40, 39])
        expect(collection.map(&:name).sort).to eq ["Gift of the Lich", "Ire of the Ascended"]
      end
    end
  end

  describe "#find_all_conduits" do
    it "fetches all conduit data" do
      with_connection("wow_conduit_all") do
        result = RBattlenet::Wow::Conduit.all
        expect(result.conduits.size).to be >= 267
      end
    end
  end
end
