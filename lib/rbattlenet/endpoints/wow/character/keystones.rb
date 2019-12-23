module RBattlenet
  module Wow
    class Character::Keystones < RBattlenet::Endpoints::Base
      def self.path(character)
        RBattlenet.uri("profile/wow/character/#{character[:realm]}/#{character[:name]}/mythic-keystone-profile?namespace=profile-")
      end
    end
  end
end
