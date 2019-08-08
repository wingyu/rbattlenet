module RBattlenet
  module Sc2
    class Ladder
      def self.find(id:, region_id:)
        uri = RBattlenet.
          base_uri("#{GAME}/legacy/ladder/#{region_id}/#{id}")

        RBattlenet.get(uri)
      end
    end
  end
end
