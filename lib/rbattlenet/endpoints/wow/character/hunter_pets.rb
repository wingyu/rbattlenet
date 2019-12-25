module RBattlenet
  module Wow
    class Character::HunterPets < RBattlenet::Endpoints::Base
      def self.path(character)
        RBattlenet.uri("profile/wow/character/#{character[:realm]}/#{character[:name]}/hunter-pets?namespace=profile-")
      end
    end
  end
end
