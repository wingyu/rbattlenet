module RBattlenet
  module Wow
    class Character::PvpBracket5v5 < RBattlenet::Endpoints::Base
      def self.path(character)
        RBattlenet.uri("profile/wow/character/#{character[:realm]}/#{character[:name]}/pvp-bracket/5v5?namespace=profile-")
      end
    end
  end
end
