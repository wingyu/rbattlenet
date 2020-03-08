module RBattlenet
  module Wow
    class Character::CompletedQuests < RBattlenet::Endpoints::Base
      def self.path(character)
        RBattlenet.uri("profile/wow/character/#{character[:realm]}/#{character[:name]}/quests/completed?namespace=profile-")
      end
    end
  end
end
