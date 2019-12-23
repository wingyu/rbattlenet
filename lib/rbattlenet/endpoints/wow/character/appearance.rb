module RBattlenet
  module Wow
    class Character::Appearance < RBattlenet::Endpoints::Base
      def self.path(character)
        RBattlenet.uri("profile/wow/character/#{character[:realm]}/#{character[:name]}/appearance?namespace=profile-")
      end
    end
  end
end
