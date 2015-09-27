require 'spec_helper'

describe RBattlenet::Wow::Recipe do
  before do
    RBattlenet.authenticate(ENV["API"])
    RBattlenet.set_region("us", "en_us")
  end

  describe "#find" do
    it "fetches recipe data" do
      VCR.use_cassette('wow_recipe') do
        recipe = RBattlenet::Wow::Recipe.
          find(33994)

        expect(recipe['name']).to eq "Precise Strikes"
      end
    end
  end
end
