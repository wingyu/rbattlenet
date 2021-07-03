module RBattlenet
  module Wow
    class Character < RBattlenet::Endpoints::Base
      SUPPORTED_FIELDS = [:itself, :achievements, :appearance, :equipment, :hunter_pets, :keystones, :media,
                          :mounts, :pets, :pvp_summary, :reputations, :soulbinds, :specializations, :statistics,
                          :status, :titles, :legacy, :season_keystones]

      class << self
        def path(character)
          RBattlenet.uri("profile/wow/character/#{character[:realm]}/#{character[:name]}?namespace=profile-")
        end

        def achievements
          RBattlenet::Wow::Character::Achievements
        end

        def achievement_statistics
          RBattlenet::Wow::Character::AchievementStatistics
        end

        def active_quests
          RBattlenet::Wow::Character::ActiveQuests
        end

        def appearance
          RBattlenet::Wow::Character::Appearance
        end

        def completed_dungeons
          RBattlenet::Wow::Character::CompletedDungeons
        end

        def completed_quests
          RBattlenet::Wow::Character::CompletedQuests
        end

        def completed_raids
          RBattlenet::Wow::Character::CompletedRaids
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

        def season_keystones
          RBattlenet::Wow::Character::SeasonKeystones
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

        def professions
          RBattlenet::Wow::Character::Professions
        end

        def pvp_bracket_2v2
          RBattlenet::Wow::Character::PvpBracket2v2
        end

        def pvp_bracket_3v3
          RBattlenet::Wow::Character::PvpBracket3v3
        end

        def pvp_bracket_rbg
          RBattlenet::Wow::Character::PvpBracketRbg
        end

        def pvp_summary
          RBattlenet::Wow::Character::PvpSummary
        end

        def reputations
          RBattlenet::Wow::Character::Reputations
        end

        def soulbinds
          RBattlenet::Wow::Character::Soulbinds
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

        def legacy
          RBattlenet::Wow::Character::Legacy
        end
      end
    end
  end
end
