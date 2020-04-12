module RBattlenet
  module Wow
    class Character::Encounters::Raids < RBattlenet::Endpoints::Base
      def self.path(character)
          RBattlenet.uri("profile/wow/character/#{character[:realm]}/#{character[:name]}/encounters/raids?namespace=profile-")
      end
    end
  end
end
