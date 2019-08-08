require 'spec_helper'

describe "non-US region and locale functionality" do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
    RBattlenet.set_region(region: "us", locale: "en_us")
  end

  context "Find character" do
    it "fetches parses and fetches optional field data" do
      VCR.use_cassette('query_fields') do
        character = RBattlenet::Wow::Character.
          find(name: "milhause", realm: "saurfang", fields: ["pet slots", "guild"])

        aggregate_failures do
          expect(character['petSlots'].count).to eq 3
          expect(character['guild']['name']).to eq "Razors Edge"
        end
      end
    end
  end
end
