require 'spec_helper'

describe RBattlenet::Wow::Challenge do
  before do
    RBattlenet.authenticate(client_id: ENV['CLIENT_ID'], client_secret: ENV['CLIENT_SECRET'])
    RBattlenet.set_region(region: 'us', locale: 'en_us')
  end

  describe '#find_realm' do
    it 'fetches realm leaderboard data' do
      VCR.use_cassette('wow_challenge_realm') do
        realm_leaderboard = RBattlenet::Wow::Challenge.find_realm(realm: 'saurfang')

        expect(realm_leaderboard['challenge'].count).to be > 1
      end
    end
  end

  describe '#find_region' do
    it 'fetches region leaderboard data' do
      VCR.use_cassette('wow_challenge_region') do
        region_leaderboard = RBattlenet::Wow::Challenge.find_region

        expect(region_leaderboard['challenge'].count).to be > 1
      end
    end
  end
end
