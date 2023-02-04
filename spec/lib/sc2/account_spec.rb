require 'spec_helper'

describe RBattlenet::Sc2::Account do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_account" do
    it "fetches account data" do
      with_connection("sc2_account") do
        result = RBattlenet::Sc2::Account.find(2137104)
        expect(result.data.name).to eq "Rigs"
      end
    end
  end

  describe "#find_multiple_account" do
    it "fetches account data" do
      with_connection("sc2_account_multiple") do
        collection = RBattlenet::Sc2::Account.find([2137104, 2137105])
        expect(collection.map(&:data).map(&:name).sort).to eq ["Rigs", "add"]
      end
    end
  end
end
