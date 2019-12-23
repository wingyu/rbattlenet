require 'spec_helper'

describe RBattlenet::D3::Hero::FollowerItems do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_hero_follower_items" do
    it "fetches hero follower items data" do
      with_connection("d3_hero_follower_items") do
        result = RBattlenet::D3::Hero::FollowerItems.find(battletag: "FaYe-2543", id: 104729462)
        expect(result.templar.neck.name).to eq "The Ess of Johan"
      end
    end
  end
end
