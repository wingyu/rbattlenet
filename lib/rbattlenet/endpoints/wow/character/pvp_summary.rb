module RBattlenet
  module Wow
    class Character::PvpSummary < RBattlenet::Endpoints::Base
      def self.path(character)
        RBattlenet.uri("profile/wow/character/#{character[:realm]}/#{character[:name]}/pvp-summary?namespace=profile-")
      end
    end
  end
end
