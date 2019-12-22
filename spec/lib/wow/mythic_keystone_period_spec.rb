require 'spec_helper'

describe RBattlenet::Wow::MythicKeystonePeriod do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_mythic_keystone_period" do
    it "fetches mythic keystone period data" do
      with_connection("wow_mythic_keystone_period") do
        result = RBattlenet::Wow::MythicKeystonePeriod.find(682)
        expect(result.start_timestamp).to eq 1548226800000
      end
    end
  end

  describe "#find_multiple_mythic_keystone_periods" do
    it "fetches mythic keystone period data" do
      with_connection("wow_mythic_keystone_period_multiple") do
        collection = RBattlenet::Wow::MythicKeystonePeriod.find([682, 683])
        expect(collection.results.map(&:start_timestamp).sort).to eq [1548226800000, 1548831600000]
      end
    end
  end

  describe "#find_all_mythic_keystone_periods" do
    it "fetches all mythic keystone period data" do
      with_connection("wow_mythic_keystone_period_all") do
        result = RBattlenet::Wow::MythicKeystonePeriod.all
        expect(result.periods.size).to be >= 4
      end
    end
  end
end
