require 'spec_helper'

describe RBattlenet::Wow::Character::CompletedRaids do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_character_completed_raids" do
    it "fetches character data" do
      with_connection("wow_character_completed_raids") do
        result = RBattlenet::Wow::Character::CompletedRaids.find(realm: "stormrage", name: "sheday")
        expect(result.expansions.class).to eq Array
      end
    end
  end

  describe "#find_multiple_character_completed_raidss" do
    it "fetches character data" do
      with_connection("wow_character_completed_raids_multiple") do
        collection = RBattlenet::Wow::Character::CompletedRaids.find([
          { realm: "stormrage", name: "sheday" },
          { realm: "howling-fjord", name: "альвеоняша" },
        ])
        expect(collection.results.map(&:expansions).map(&:class)).to eq [Array, Array]
      end
    end
  end
end
