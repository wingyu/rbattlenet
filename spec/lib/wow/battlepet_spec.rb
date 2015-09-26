require 'spec_helper'

describe RBattlenet::Wow::Battlepet do
  before do
    RBattlenet.authenticate(ENV["API"])
    RBattlenet.set_region("us", "en_us")
  end

  describe "#find_abilities" do
    it "fetches abilities data" do
      VCR.use_cassette('battlepet_abilities') do
        ability = RBattlenet::Wow::Battlepet.
          find_abilities(640)

        expect(ability['id']).to eq 640
      end
    end
  end

  describe "#find_species" do
    it "fetches species data" do
      VCR.use_cassette('battlepet_species') do
        species = RBattlenet::Wow::Battlepet.
          find_species(258)

        expect(species['speciesId']).to eq 258
      end
    end
  end

  describe "#find_stats" do
    it "fetches stats data" do
      VCR.use_cassette('battlepet_stats') do
        stats = RBattlenet::Wow::Battlepet.
          find_stats(258, 25, 5, 4)

        expect(stats['power']).to eq 315 
      end
    end
  end
end
