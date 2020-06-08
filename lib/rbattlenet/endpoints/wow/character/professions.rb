module RBattlenet
  module Wow
    class Character::Professions < RBattlenet::Endpoints::Base
      def self.path(character)
        RBattlenet.uri("profile/wow/character/#{character[:realm]}/#{character[:name]}/professions?namespace=profile-")
      end
    end
  end
end
