require 'spec_helper'

describe "non-US region and locale functionality" do
  before do
    RBattlenet.authenticate(ENV["API"])
    RBattlenet.set_region("us", "en_us")
  end

  context "Find character" do
    it "fetches parses and fetches optional field data" do
      VCR.use_cassette('query_fields') do
        character = RBattlenet::Wow::Character.
          find("milhause", "saurfang", ["pet slots", "guild"])

        aggregate_failures do
          expect(character['petSlots'].count).to eq 3
          expect(character['guild']['name']).to eq "Razors Edge"
        end
      end
    end
  end
end
