require 'spec_helper'

describe RBattlenet::Wow::Character do
  before do
    RBattlenet.authenticate(ENV["API"])
    RBattlenet.set_region("us", "en_us")
  end

  describe "#search" do
    it "fetches character data" do
      VCR.use_cassette('character_profile') do
        character = RBattlenet::Wow::Character.
          search("milhause", "saurfang")

        expect(character['level']).to eq 100
      end
    end

    it "fetches optional field data" do
      VCR.use_cassette('character_fields') do
        character = RBattlenet::Wow::Character.
          search("milhause", "saurfang", "pet slots")

        expect(character['petSlots'].count).to eq 3
      end
    end
  end
end
