require 'spec_helper'

describe RBattlenet::Wow::Guild do
  before do
    RBattlenet.authenticate(client_id: ENV['CLIENT_ID'], client_secret: ENV['CLIENT_SECRET'])
    RBattlenet.set_region(region: 'eu', locale: 'en_GB')
  end

  describe '#find' do
    it 'fetches guild profile data' do
      VCR.use_cassette('wow_guild_profile') do
        guild = RBattlenet::Wow::Guild.find(name: 'Remember My Duck', realm: 'sargeras')
        expect(guild['name']).to eq 'Remember My Duck'
      end
    end

    it 'fetches optional field data' do
      VCR.use_cassette('wow_guild_fields') do
        guild = RBattlenet::Wow::Guild.find(name: 'Remember My Duck', realm: 'sargeras', fields: ['members'])
        expect(guild['members']).not_to be_nil
      end
    end
  end
end
