module RBattlenet
  module Wow
    class Character::Mounts < RBattlenet::Endpoints::Base
      def self.path(character)
        RBattlenet.uri("profile/wow/character/#{character[:realm]}/#{character[:name]}/collections/mounts?namespace=profile-")
      end
    end
  end
end
