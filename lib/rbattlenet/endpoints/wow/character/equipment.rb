module RBattlenet
  module Wow
    class Character::Equipment < RBattlenet::Endpoints::Base
      def self.path(character)
        RBattlenet.uri("profile/wow/character/#{character[:realm]}/#{character[:name]}/equipment?namespace=profile-")
      end
    end
  end
end
