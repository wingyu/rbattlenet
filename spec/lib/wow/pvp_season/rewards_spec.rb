require 'spec_helper'

describe RBattlenet::Wow::PvpSeason::Rewards do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_pvp_season_rewards" do
    it "fetches pvp season reward data" do
      with_connection("wow_pvp_season_rewards") do
        result = RBattlenet::Wow::PvpSeason::Rewards.find(27)
        expect(result.rewards.size).to eq 4
      end
    end
  end

  describe "#find_multiple_pvp_season_rewardss" do
    it "fetches pvp season reward data" do
      with_connection("wow_pvp_season_rewards_multiple") do
        collection = RBattlenet::Wow::PvpSeason::Rewards.find([28, 27])
        expect(collection.map(&:rewards).map(&:size)).to eq [4, 4]
      end
    end
  end
end
