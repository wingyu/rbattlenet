module RBattlenet
  module Wow
    class Character::Pets < RBattlenet::Endpoints::Base
      def self.path(character)
        RBattlenet.uri("profile/wow/character/#{character[:realm]}/#{character[:name]}/collections/pets?namespace=profile-")
      end
    end
  end
end
