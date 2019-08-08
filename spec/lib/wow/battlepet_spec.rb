require 'spec_helper'

describe RBattlenet::Wow::Battlepet do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
    RBattlenet.set_region(region: "us", locale: "en_us")
  end

  describe "#find_abilities" do
    it "fetches abilities data" do
      VCR.use_cassette('wow_battlepet_abilities') do
        ability = RBattlenet::Wow::Battlepet.find_abilities(id: 640)
        expect(ability['id']).to eq 640
      end
    end
  end

  describe "#find_species" do
    it "fetches species data" do
      VCR.use_cassette('wow_battlepet_species') do
        species = RBattlenet::Wow::Battlepet.find_species(species_id: 258)

        expect(species['speciesId']).to eq 258
      end
    end
  end

  describe "#find_stats" do
    it "fetches stats data" do
      VCR.use_cassette('wow_battlepet_stats') do
        stats = RBattlenet::Wow::Battlepet.find_stats(species_id: 258,
          level: 25,
          breed_id: 5,
          quality_id: 4
        )

        expect(stats['power']).to eq 315
      end
    end
  end
end
