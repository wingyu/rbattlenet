require 'spec_helper'

describe RBattlenet::Wow::Quest do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
    RBattlenet.set_region(region: "us", locale: "en_us")
  end

  describe "#find" do
    it "fetches quest data" do
      VCR.use_cassette('wow_quest') do
        quest = RBattlenet::Wow::Quest.
          find(id: 13146)

        expect(quest['title']).to eq "Generosity Abounds"
      end
    end
  end
end
