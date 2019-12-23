module RBattlenet
  module Wow
    class Character::Titles < RBattlenet::Endpoints::Base
      def self.path(character)
        RBattlenet.uri("profile/wow/character/#{character[:realm]}/#{character[:name]}/titles?namespace=profile-")
      end
    end
  end
end
