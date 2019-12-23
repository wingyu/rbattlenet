module RBattlenet
  module Wow
    class Character::Status < RBattlenet::Endpoints::Base
      def self.path(character)
        RBattlenet.uri("profile/wow/character/#{character[:realm]}/#{character[:name]}/status?namespace=profile-")
      end
    end
  end
end
