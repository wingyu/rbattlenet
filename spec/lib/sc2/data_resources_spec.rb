require 'spec_helper'

describe RBattlenet::Sc2::DataResources do
  before do
    RBattlenet.authenticate(api_key: ENV["API"])
    RBattlenet.set_region(region: "us", locale: "en_US")
  end

  describe "#find_achievements" do
    it "fetches achievements data" do
      VCR.use_cassette('s2_data_resources_achievements') do
        achievements = RBattlenet::Sc2::DataResources.
          find_achievements

        expect(achievements['achievements'][0]['title']).
          to eq "FFA Destroyer"
      end
    end
  end

  describe "#find_rewards" do
    it "fetches rewards data" do
      VCR.use_cassette('s2_data_resources_rewards') do
        rewards = RBattlenet::Sc2::DataResources.
          find_rewards

        expect(rewards['portraits'][0]['title']).
          to eq "Kachinsky"
      end
    end
  end
end
