module RBattlenet
  module Wow
    class Item
      def self.find(id:)
        uri = RBattlenet.
          base_uri("#{GAME}/item/#{id}")

        RBattlenet.get(uri)
      end

      def self.find_set(id:)
        uri = RBattlenet.
          base_uri("#{GAME}/item/set/#{id}")

        RBattlenet.get(uri)
      end
    end
  end
end

