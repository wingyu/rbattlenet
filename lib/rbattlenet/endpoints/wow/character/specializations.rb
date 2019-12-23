module RBattlenet
  module Wow
    class Character::Specializations < RBattlenet::Endpoints::Base
      def self.path(character)
        RBattlenet.uri("profile/wow/character/#{character[:realm]}/#{character[:name]}/specializations?namespace=profile-")
      end
    end
  end
end
