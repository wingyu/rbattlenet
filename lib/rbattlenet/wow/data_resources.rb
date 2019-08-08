module RBattlenet
  module Wow
    class DataResources
      def self.find_battlegroups
        uri = RBattlenet.base_uri("#{GAME}/data/battlegroups/")
        RBattlenet.get(uri)
      end

      def self.find_character_races
        uri = RBattlenet.base_uri("#{GAME}/data/character/races")
        RBattlenet.get(uri)
      end

      def self.find_character_classes
        uri = RBattlenet.base_uri("#{GAME}/data/character/classes")
        RBattlenet.get(uri)
      end

      def self.find_character_achievements
        uri = RBattlenet.base_uri("#{GAME}/data/character/achievements")
        RBattlenet.get(uri)
      end

      def self.find_guild_rewards
        uri = RBattlenet.base_uri("#{GAME}/data/guild/rewards")
        RBattlenet.get(uri)
      end

      def self.find_guild_perks
        uri = RBattlenet.base_uri("#{GAME}/data/guild/perks")
        RBattlenet.get(uri)
      end

      def self.find_guild_achievements
        uri = RBattlenet.base_uri("#{GAME}/data/guild/achievements")
        RBattlenet.get(uri)
      end

      def self.find_item_classes
        uri = RBattlenet.base_uri("#{GAME}/data/item/classes")
        RBattlenet.get(uri)
      end

      def self.find_talents
        uri = RBattlenet.base_uri("#{GAME}/data/talents")
        RBattlenet.get(uri)
      end

      def self.find_pet_types
        uri = RBattlenet.base_uri("#{GAME}/data/pet/types")
        RBattlenet.get(uri)
      end

      def self.token()
        queries = "namespace=dynamic-#{RBattlenet.region}"
        uri = RBattlenet.base_uri('data/wow/token/')
        RBattlenet.get(uri, queries)
      end
    end
  end
end
