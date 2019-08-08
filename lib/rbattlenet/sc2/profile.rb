module RBattlenet
  module Sc2
    class Profile
      def self.find(profile_id:, region:, realm:)
        uri = RBattlenet.
          base_uri("#{GAME}/legacy/profile/#{region}/#{realm}/#{profile_id}/")

        RBattlenet.get(uri)
        raise "deprecated"
      end

      def self.find_ladders(id:, region:, realm:)
        uri = RBattlenet.
          base_uri("#{GAME}/legacy/profile/#{region}/#{realm}/#{id}/ladders")

        RBattlenet.get(uri)
      end

      def self.find_match_history(id:, region:, realm:)
        uri = RBattlenet.
          base_uri("#{GAME}/legacy/profile/#{region}/#{realm}/#{id}/matches")

        RBattlenet.get(uri)
      end
    end
  end
end
