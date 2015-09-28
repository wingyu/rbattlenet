module RBattlenet
  module Wow
    class Item
      def self.find(item_id)
        uri = RBattlenet.
          base_uri("#{GAME}/item/#{item_id}")

        RBattlenet.get(uri)
      end

      def self.find_set(item_set_id)
        uri = RBattlenet.
          base_uri("#{GAME}/item/set/#{item_set_id}")

        RBattlenet.get(uri)
      end
    end
  end
end

