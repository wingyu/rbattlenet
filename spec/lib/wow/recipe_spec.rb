require 'spec_helper'

describe RBattlenet::Wow::Recipe do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
    RBattlenet.set_region(region: "us", locale: "en_us")
  end

  describe "#find" do
    it "fetches recipe data" do
      VCR.use_cassette('wow_recipe') do
        recipe = RBattlenet::Wow::Recipe.
          find(id: 33994)

        expect(recipe['name']).to eq "Precise Strikes"
      end
    end
  end
end
