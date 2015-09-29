require 'spec_helper'

describe RBattlenet::Wow::Spell do
  before do
    RBattlenet.authenticate(api_key: ENV["API"])
    RBattlenet.set_region(region: "us", locale: "en_us")
  end

  describe "#find" do
    it "fetches spell data" do
      VCR.use_cassette('wow_spell') do
        spell = RBattlenet::Wow::Spell.
          find(id: 8056)

        expect(spell['name']).to eq "Frost Shock"
      end
    end
  end
end
