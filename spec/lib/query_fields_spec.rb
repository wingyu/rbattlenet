require 'spec_helper'

describe "non-US region and locale functionality" do
  before do
    RBattlenet.authenticate(ENV["API"])
    RBattlenet.set_region("us", "en_us")
  end

  context "Character search" do
    it "fetches optional field data" do
      VCR.use_cassette('query_fields') do
        character = RBattlenet::Wow::Character.
          search("milhause", "saurfang", "pet slots")

        expect(character['petSlots'].count).to eq 3
      end
    end
  end
end
