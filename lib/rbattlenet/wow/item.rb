module RBattlenet
  module Wow
    class Item
      def self.search_item(item_id)
        uri = RBattlenet.
          base_uri("#{GAME}/item/#{item_id}")

        RBattlenet.get(uri)
      end

      def self.search_item_set(item_set_id)
        uri = RBattlenet.
          base_uri("#{GAME}/item/set/#{item_set_id}")

        RBattlenet.get(uri)
      end
    end
  end
end

