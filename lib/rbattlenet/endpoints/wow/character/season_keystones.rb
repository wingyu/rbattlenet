module RBattlenet
  module Wow
    class Character::SeasonKeystones < RBattlenet::Endpoints::Base
      def self.path(character)
        RBattlenet.uri("profile/wow/character/#{character[:realm]}/#{character[:name]}/mythic-keystone-profile/season/#{character[:season]}?namespace=profile-")
      end
    end
  end
end
