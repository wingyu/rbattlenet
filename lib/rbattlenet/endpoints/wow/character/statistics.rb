module RBattlenet
  module Wow
    class Character::Statistics < RBattlenet::Endpoints::Base
      def self.path(character)
        RBattlenet.uri("profile/wow/character/#{character[:realm]}/#{character[:name]}/statistics?namespace=profile-")
      end
    end
  end
end
