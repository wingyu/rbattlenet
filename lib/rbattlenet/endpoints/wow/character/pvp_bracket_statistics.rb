module RBattlenet
  module Wow
    class Character::PvpBracketStatistics < RBattlenet::Endpoints::Base
      def self.path(character)
        RBattlenet.uri("profile/wow/character/#{character[:realm]}/#{character[:name]}/pvp-bracket/#{character[:bracket]}?namespace=profile-")
      end
    end
  end
end
