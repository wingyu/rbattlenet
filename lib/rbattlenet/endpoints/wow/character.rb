module RBattlenet
  module Wow
    class Character < RBattlenet::Endpoints::Base
      SUPPORTED_FIELDS = [:itself, :achievements, :appearance, :encounters, :equipment, :hunter_pets, :keystones, :media,
                          :mounts, :pets, :pvp_summary, :reputations, :specializations, :statistics, :status,
                          :titles]

      class << self
        def path(character)
          RBattlenet.uri("profile/wow/character/#{character[:realm]}/#{character[:name]}?namespace=profile-")
        end

        def achievements
          RBattlenet::Wow::Character::Achievements
        end

        def appearance
          RBattlenet::Wow::Character::Appearance
        end

        def encounters
          RBattlenet::Wow::Character::Encounters
        end

        def equipment
          RBattlenet::Wow::Character::Equipment
        end

        def hunter_pets
          RBattlenet::Wow::Character::HunterPets
        end

        def keystones
          RBattlenet::Wow::Character::Keystones
        end

        def media
          RBattlenet::Wow::Character::Media
        end

        def mounts
          RBattlenet::Wow::Character::Mounts
        end

        def pets
          RBattlenet::Wow::Character::Pets
        end

        def pvp_summary
          RBattlenet::Wow::Character::PvpSummary
        end

        def reputations
          RBattlenet::Wow::Character::Reputations
        end

        def specializations
          RBattlenet::Wow::Character::Specializations
        end

        def statistics
          RBattlenet::Wow::Character::Statistics
        end

        def status
          RBattlenet::Wow::Character::Status
        end

        def titles
          RBattlenet::Wow::Character::Titles
        end
      end
    end
  end
end
