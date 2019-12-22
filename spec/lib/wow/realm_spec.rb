require 'spec_helper'

describe RBattlenet::Wow::Realm do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_realm" do
    it "fetches realm data" do
      with_connection("wow_realm") do
        result = RBattlenet::Wow::Realm.find(500)
        expect(result.name).to eq "Aggramar"
      end
    end
  end

  describe "#find_multiple_realms" do
    it "fetches realm data" do
      with_connection("wow_realm_multiple") do
        collection = RBattlenet::Wow::Realm.find([500, 501])
        expect(collection.results.map(&:name).sort).to eq ["Aggramar", "Arathor"]
      end
    end
  end

  describe "#find_all_realms" do
    it "fetches all realm data" do
      with_connection("wow_realm_all") do
        result = RBattlenet::Wow::Realm.all
        expect(result.realms.size).to eq 267
      end
    end
  end
end
