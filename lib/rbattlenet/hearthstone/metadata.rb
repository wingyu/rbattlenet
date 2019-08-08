# https://develop.battle.net/documentation/api-reference/hearthstone-game-data-api

# All metadata
# GET - /hearthstone/metadata

# Specific metadata
# GET - /hearthstone/metadata/:type

module RBattlenet
  module Hearthstone
    class Metadata
      def self.all_metadata()
        uri = RBattlenet.base_uri("#{GAME}/metadata")

        RBattlenet.get(uri)
      end

      def self.find_metadata(type:)
        # valid types:  sets, setGroups, types, rarities, classes, minionTypes, and keywords.
        uri = RBattlenet.base_uri("#{GAME}/metadata/#{type}")

        RBattlenet.get(uri)
      end
    end
  end
end
