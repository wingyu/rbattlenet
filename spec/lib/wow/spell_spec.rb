require 'spec_helper'

describe RBattlenet::Wow::Spell do
  before do
    RBattlenet.authenticate(client_id: ENV['CLIENT_ID'], client_secret: ENV['CLIENT_SECRET'])
    RBattlenet.set_region(region: 'us', locale: 'en_us')
  end

  describe '#find' do
    it 'fetches spell data' do
      VCR.use_cassette('wow_spell') do
        spell = RBattlenet::Wow::Spell.find(id: 186886)
        expect(spell['name']).to eq 'Summon Frostmourne Bunny'
      end
    end
  end
end
