module RBattlenet
  module Wow
    class Battlepet
      def self.search_abilities(id)
        uri = RBattlenet.
          base_uri("#{GAME}/battlePet/ability/#{id}?")

        HTTParty.get(uri)
      end

      def self.search_species(species_id)
        uri = RBattlenet.
          base_uri("#{GAME}/battlePet/species/#{species_id}?")

        HTTParty.get(uri)
      end

      def self.search_stats(species_id, level, breed_id, quality_id)
        uri = RBattlenet.
          base_uri("#{GAME}/battlePet/stats/#{species_id}?level=#{level}&breedId=#{breed_id}&qualityId=#{quality_id}")

        HTTParty.get(uri)
      end
    end
  end
end

