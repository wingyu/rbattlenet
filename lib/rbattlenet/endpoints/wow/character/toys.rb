module RBattlenet
  module Wow
    class Character::Toys < RBattlenet::Endpoints::Base
      def self.path(character)
        RBattlenet.uri("profile/wow/character/#{character[:realm]}/#{character[:name]}/collections/toys?namespace=profile-")
      end
    end
  end
end
