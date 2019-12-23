module RBattlenet
  module Wow
    class Character::Achievements < RBattlenet::Endpoints::Base
      def self.path(character)
        RBattlenet.uri("profile/wow/character/#{character[:realm]}/#{character[:name]}/achievements?namespace=profile-")
      end
    end
  end
end
