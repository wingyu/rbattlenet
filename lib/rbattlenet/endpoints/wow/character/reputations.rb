module RBattlenet
  module Wow
    class Character::Reputations < RBattlenet::Endpoints::Base
      def self.path(character)
        RBattlenet.uri("profile/wow/character/#{character[:realm]}/#{character[:name]}/reputations?namespace=profile-")
      end
    end
  end
end
