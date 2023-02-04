require 'spec_helper'

describe RBattlenet::Sc2::Legacy::Ladder do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_ladder" do
    it "fetches ladder data" do
      with_connection("sc2_legacy_ladder") do
        result = RBattlenet::Sc2::Legacy::Ladder.find(region_id: 2, id: 2200)
        expect(result.ladderMembers.size).to be >= 300
      end
    end
  end

  describe "#find_multiple_ladder" do
    it "fetches ladder profile data" do
      with_connection("sc2_legacy_ladder_multiple") do
        collection = RBattlenet::Sc2::Legacy::Ladder.find([
          { region_id: 2, id: 2200 },
          { region_id: 2, id: 2201 },
        ])
        expect(collection.map(&:ladderMembers).map(&:size).sort).to eq [200, 300]
      end
    end
  end
end
