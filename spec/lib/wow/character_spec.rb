require 'spec_helper'

describe RBattlenet::Wow::Character do
  before do
    RBattlenet.authenticate(ENV["API"])
    RBattlenet.set_region("us", "en_us")
  end

  describe "#search" do
    context "US region" do
      it "fetches character data" do
        VCR.use_cassette('character_milhause') do
          character = RBattlenet::Wow::Character.
            search("milhause", "saurfang")

          expect(character['level']).to eq 100
        end
      end

      it "fetches character data with multi-worded realm" do
        VCR.use_cassette('character_agripper') do
          character = RBattlenet::Wow::Character.
            search("agripper", "Altar of Storms")

          expect(character['level']).to eq 100
        end
      end

      it "fetches optional field data" do
        VCR.use_cassette('character_milhause_petslots') do
          character = RBattlenet::Wow::Character.
            search("milhause", "saurfang", "pet slots")

          expect(character['petSlots'].count).to eq 3
        end
      end
    end

    context "non-US region" do
      it "fetches character data" do
        VCR.use_cassette('character_madfrogz') do
          RBattlenet.set_region("eu", "en_GB")
          character = RBattlenet::Wow::Character.
            search("madfrogz", "outland")

          expect(character['level']).to eq 100
        end
      end
    end
  end
end
