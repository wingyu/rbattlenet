require 'spec_helper'

describe RBattlenet::Wow::MythicKeystoneSeason do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_mythic_keystone_season" do
    it "fetches mythic keystone season data" do
      with_connection("wow_mythic_keystone_season") do
        result = RBattlenet::Wow::MythicKeystoneSeason.find(2)
        expect(result.periods.size).to be >= 24
      end
    end
  end

  describe "#find_multiple_mythic_keystone_seasons" do
    it "fetches mythic keystone season data" do
      with_connection("wow_mythic_keystone_season_multiple") do
        collection = RBattlenet::Wow::MythicKeystoneSeason.find([1, 2])
        expect(collection.results.map(&:periods).map(&:size).sort).to eq [22, 24]
      end
    end
  end

  describe "#find_all_mythic_keystone_seasons" do
    it "fetches all mythic keystone season data" do
      with_connection("wow_mythic_keystone_season_all") do
        result = RBattlenet::Wow::MythicKeystoneSeason.all
        expect(result.seasons.size).to be >= 4
      end
    end
  end
end
