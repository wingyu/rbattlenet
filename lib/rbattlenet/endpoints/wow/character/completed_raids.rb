module RBattlenet
  module Wow
    class Character::CompletedRaids < RBattlenet::Endpoints::Base
      def self.path(character)
        RBattlenet.uri("profile/wow/character/#{character[:realm]}/#{character[:name]}/encounters/raids?namespace=profile-")
      end
    end
  end
end
