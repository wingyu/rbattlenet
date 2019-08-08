require 'spec_helper'

describe RBattlenet::Sc2::DataResources do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
    RBattlenet.set_region(region: "us", locale: "en_US")
  end

  describe "#find_achievements" do
    it "fetches achievements data" do
      VCR.use_cassette('s2_data_resources_achievements') do
        achievements = RBattlenet::Sc2::DataResources.
          find_achievements(region_id: 1)

        expect(achievements['achievements'][0]['title']).
          to eq "Advanced Stalker"
      end
    end
  end

  describe "#find_rewards" do
    it "fetches rewards data" do
      VCR.use_cassette('s2_data_resources_rewards') do
        rewards = RBattlenet::Sc2::DataResources.
          find_rewards(region_id: 1)

        expect(rewards['portraits'][0]['title']).
          to eq "Kachinsky"
      end
    end
  end
end
