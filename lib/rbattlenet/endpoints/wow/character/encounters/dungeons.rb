module RBattlenet
  module Wow
    class Character::Encounters::Dungeons < RBattlenet::Endpoints::Base
      def self.path(character)
          RBattlenet.uri("profile/wow/character/#{character[:realm]}/#{character[:name]}/encounters/dungeons?namespace=profile-")
      end
    end
  end
end
