# https://develop.battle.net/documentation/api-reference/hearthstone-game-data-api

# Fetch deck
# GET - /hearthstone/deck/:deckcode

module RBattlenet
  module Hearthstone
    class Deck
      def self.find_deck(deckcode:)
        uri  = RBattlenet.base_uri("#{GAME}/deck/#{deckcode}")

        RBattlenet.get(uri)
      end
    end
  end
end



