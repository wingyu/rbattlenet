module RBattlenet
  module D3
    class DataResources
      def self.find_item(data)
        uri = RBattlenet.base_uri("#{GAME}/data/item/#{data}")

        RBattlenet.get(uri)
      end

      def self.find_follower(follower)
        uri = RBattlenet.base_uri("#{GAME}/data/follower/#{follower}")

        RBattlenet.get(uri)
      end

      def self.find_artisan(artisan)
        uri = RBattlenet.base_uri("#{GAME}/data/artisan/#{artisan}")

        RBattlenet.get(uri)
      end
    end
  end
end
