module RBattlenet
  module Sc2
    class Ladder
      def self.find(id:)
        uri = RBattlenet.
          base_uri("#{GAME}/ladder/#{id}")

        RBattlenet.get(uri)
      end
    end
  end
end
