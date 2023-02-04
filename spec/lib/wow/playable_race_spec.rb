require 'spec_helper'

describe RBattlenet::Wow::PlayableRace do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_playable_race" do
    it "fetches playable race data" do
      with_connection("wow_playable_race") do
        result = RBattlenet::Wow::PlayableRace.find(1)
        expect(result.name).to eq "Human"
      end
    end
  end

  describe "#find_multiple_playable_races" do
    it "fetches playable race data" do
      with_connection("wow_playable_race_multiple") do
        collection = RBattlenet::Wow::PlayableRace.find([1, 2])
        expect(collection.map(&:name).sort).to eq ["Human", "Orc"]
      end
    end
  end

  describe "#find_all_playable_races" do
    it "fetches all playable race data" do
      with_connection("wow_playable_race_all") do
        result = RBattlenet::Wow::PlayableRace.all
        expect(result.races.size).to be >= 8
      end
    end
  end
end
