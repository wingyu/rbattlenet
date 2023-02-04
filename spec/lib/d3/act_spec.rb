require 'spec_helper'

describe RBattlenet::D3::Act do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_act" do
    it "fetches act data" do
      with_connection("d3_act") do
        result = RBattlenet::D3::Act.find(1)
        expect(result.name).to eq "Act I"
      end
    end
  end

  describe "#find_multiple_acts" do
    it "fetches act data" do
      with_connection("d3_act_multiple") do
        collection = RBattlenet::D3::Act.find([1, 2])
        expect(collection.map(&:name).sort).to eq ["Act I", "Act II"]
      end
    end
  end

  describe "#find_all_acts" do
    it "fetches all act data" do
      with_connection("d3_act_all") do
        result = RBattlenet::D3::Act.all
        expect(result.acts.size).to be >= 5
      end
    end
  end
end
