module RBattlenet
  module Wow
    class Character::PvpBracket2v2 < RBattlenet::Endpoints::Base
      def self.path(character)
        RBattlenet.uri("profile/wow/character/#{character[:realm]}/#{character[:name]}/pvp-bracket/2v2?namespace=profile-")
      end
    end
  end
end
