module RBattlenet
  module Wow
    class Character::AchievementStatistics < RBattlenet::Endpoints::Base
      def self.path(character)
        RBattlenet.uri("profile/wow/character/#{character[:realm]}/#{character[:name]}/achievements/statistics?namespace=profile-")
      end
    end
  end
end
