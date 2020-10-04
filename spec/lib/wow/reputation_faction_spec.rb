require 'spec_helper'

describe RBattlenet::Wow::ReputationFaction, type: :game_data do

  describe "#find_reputation_faction" do
    it "fetches reputation faction data" do
      with_connection("wow_reputation_faction") do
        result = RBattlenet::Wow::ReputationFaction.find(21)
        expect(result.name).to eq "Booty Bay"
      end
    end
  end

  describe "#find_multiple_reputation_factions" do
    it "fetches reputation faction data" do
      with_connection("wow_reputation_faction_multiple") do
        collection = RBattlenet::Wow::ReputationFaction.find([21, 47])
        expect(collection.results.map(&:name).sort).to eq ["Booty Bay", "Ironforge"]
      end
    end
  end

  describe "#find_all_reputation_factions" do
    it "fetches all reputation faction data" do
      with_connection("wow_reputation_faction_all") do
        result = RBattlenet::Wow::ReputationFaction.all
        expect(result.factions.size).to be >= 196
      end
    end
  end
end
