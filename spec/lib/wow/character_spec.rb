require 'spec_helper'

describe RBattlenet::Wow::Character do
  before do
    RBattlenet.authenticate(api_key: ENV["API"])
    RBattlenet.set_region(region: "us", locale: "en_us")
  end

  describe "#find" do
    it "fetches character data" do
      VCR.use_cassette('wow_character_profile') do
        character = RBattlenet::Wow::Character.
          find(name: "milhause", realm: "saurfang")

        expect(character['level']).to eq 100
      end
    end

    it "fetches optional field data" do
      VCR.use_cassette('wow_character_fields') do
        character = RBattlenet::Wow::Character.
          find(name: "milhause", realm: "saurfang", fields: ["pet slots"])

        expect(character['petSlots'].count).to eq 3
      end
    end
  end
end
