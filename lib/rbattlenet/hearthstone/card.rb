# https://develop.battle.net/documentation/api-reference/hearthstone-game-data-api

# Card search
# GET - /hearthstone/cards

# Fetch one card
# GET - /hearthstone/cards/:idorslug

module RBattlenet
  module Hearthstone
    class Card
      def self.find_cards(**args)
        valid_args = %w( region locale set class mana_cost attack health
          collectible rarity type minion_type keyword text_filter sort order page page_size ).freeze

        args.select!{ |k,v| valid_args.include?(k.to_s) }
        args['manaCost']   = args.delete(:mana_cost)   if args[:mana_cost]
        args['pageSize']   = args.delete(:page_size)   if args[:page_size]
        args['minionType'] = args.delete(:minion_type) if args[:minion_type]
        args['textFilter'] = args.delete(:text_filter) if args[:text_filter]

        query_params = URI.encode_www_form(args)
        uri  = RBattlenet.base_uri("#{GAME}/cards")

        RBattlenet.get(uri, query_params)
      end

      def self.find_card(id_or_slug:)
        uri = RBattlenet.base_uri("#{GAME}/cards/#{id_or_slug}")

        RBattlenet.get(uri)
      end
    end
  end
end


