require 'spec_helper'

describe RBattlenet::D3::Follower, type: :community do

  describe "#find_follower" do
    it "fetches follower data" do
      with_connection("d3_follower") do
        result = RBattlenet::D3::Follower.find("templar")
        expect(result.realName).to eq "Kormac"
      end
    end
  end

  describe "#find_multiple_followers" do
    it "fetches follower data" do
      with_connection("d3_follower_multiple") do
        collection = RBattlenet::D3::Follower.find(["templar", "enchantress"])
        expect(collection.results.map(&:realName).sort).to eq ["Eirena", "Kormac"]
      end
    end
  end
end
