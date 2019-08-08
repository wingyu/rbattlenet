require 'spec_helper'

describe RBattlenet::Wow::Realm do
  before do
    RBattlenet.authenticate(client_id: ENV['CLIENT_ID'], client_secret: ENV['CLIENT_SECRET'])
    RBattlenet.set_region(region: 'us', locale: 'en_us')
  end

  describe '#find' do
    it 'fetches realm data' do
      VCR.use_cassette('wow_realm') do
        realms = RBattlenet::Wow::Realm.find
        expect(realms['realms']).not_to be_nil
      end
    end
  end
end
