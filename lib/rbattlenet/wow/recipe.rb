module RBattlenet
  module Wow
    class Recipe
      def self.find(id:)
        uri = RBattlenet.
          base_uri("#{GAME}/recipe/#{id}")

        RBattlenet.get(uri)
      end
    end
  end
end

