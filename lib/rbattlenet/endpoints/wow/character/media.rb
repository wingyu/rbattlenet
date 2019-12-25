module RBattlenet
  module Wow
    class Character::Media < RBattlenet::Endpoints::Base
      def self.path(character)
        RBattlenet.uri("profile/wow/character/#{character[:realm]}/#{character[:name]}/character-media?namespace=profile-")
      end
    end
  end
end
