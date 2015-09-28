module RBattlenet
  module Sc2
    class Profile
      def self.find(id, region, name)
        uri = RBattlenet.
          base_uri("#{GAME}/profile/#{id}/#{region}/#{name}/")

        RBattlenet.get(uri)
      end

      def self.find_ladders(id, region, name)
        uri = RBattlenet.
          base_uri("#{GAME}/profile/#{id}/#{region}/#{name}/ladders")

        RBattlenet.get(uri)
      end

      def self.find_match_history(id, region, name)
        uri = RBattlenet.
          base_uri("#{GAME}/profile/#{id}/#{region}/#{name}/matches")

        RBattlenet.get(uri)
      end
    end
  end
end
