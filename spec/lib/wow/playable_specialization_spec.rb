require 'spec_helper'

describe RBattlenet::Wow::PlayableSpecialization do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_playable_spec" do
    it "fetches playable spec data" do
      with_connection("wow_playable_spec") do
        result = RBattlenet::Wow::PlayableSpecialization.find(62)
        expect(result.name).to eq "Arcane"
      end
    end
  end

  describe "#find_multiple_playable_specs" do
    it "fetches playable spec data" do
      with_connection("wow_playable_spec_multiple") do
        collection = RBattlenet::Wow::PlayableSpecialization.find([62, 63])
        expect(collection.results.map(&:name).sort).to eq ["Arcane", "Fire"]
      end
    end
  end

  describe "#find_all_playable_specs" do
    it "fetches all playable spec data" do
      with_connection("wow_playable_spec_all") do
        result = RBattlenet::Wow::PlayableSpecialization.all
        expect(result.character_specializations.size).to be >= 36
      end
    end
  end
end
