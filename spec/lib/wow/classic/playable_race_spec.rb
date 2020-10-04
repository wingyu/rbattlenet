require 'spec_helper'

describe RBattlenet::Wow::Classic::PlayableRace, type: :game_data do

  describe "#find_playable_race" do
    it "fetches playable race data" do
      with_connection("wow_classic_playable_race") do
        result = RBattlenet::Wow::Classic::PlayableRace.find(1)
        expect(result.name).to eq "Human"
      end
    end
  end

  describe "#find_multiple_playable_races" do
    it "fetches playable race data" do
      with_connection("wow_classic_playable_race_multiple") do
        collection = RBattlenet::Wow::Classic::PlayableRace.find([1, 2])
        expect(collection.results.map(&:name).sort).to eq ["Human", "Orc"]
      end
    end
  end

  describe "#find_all_playable_races" do
    it "fetches all playable race data" do
      with_connection("wow_classic_playable_race_all") do
        result = RBattlenet::Wow::Classic::PlayableRace.all
        expect(result.races.size).to be >= 8
      end
    end
  end
end
