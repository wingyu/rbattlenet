module RBattlenet
  module Wow
    class Character::Encounters < RBattlenet::Endpoints::Base
      SUPPORTED_FIELDS = [:dungeons, :raids]

      class << self
        def path(character)
          RBattlenet.uri("profile/wow/character/#{character[:realm]}/#{character[:name]}/encounters?namespace=profile-")
        end

        def dungeons
          RBattlenet::Wow::Character::Encounters::Dungeons
        end

        def raids
          RBattlenet::Wow::Character::Encounters::Raids
        end
      end
    end
  end
end
