module RBattlenet
  module Wow
    class Character::PvpBracket3v3 < RBattlenet::Endpoints::Base
      def self.path(character)
        RBattlenet.uri("profile/wow/character/#{character[:realm]}/#{character[:name]}/pvp-bracket/3v3?namespace=profile-")
      end
    end
  end
end
