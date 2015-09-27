require 'spec_helper'

describe RBattlenet::Wow::Spell do
  before do
    RBattlenet.authenticate(ENV["API"])
    RBattlenet.set_region("us", "en_us")
  end

  describe "#find" do
    it "fetches spell data" do
      VCR.use_cassette('wow_spell') do
        spell = RBattlenet::Wow::Spell.
          find(8056)

        expect(spell['name']).to eq "Frost Shock"
      end
    end
  end
end
