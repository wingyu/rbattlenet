module RBattlenet
  module Wow
    class Character::Legacy < RBattlenet::Endpoints::Base
      FIELDS = [
        "items",
        "reputation",
        "audit",
        "statistics",
        "achievements",
        "pets",
        "pvp",
        "professions",
        "quests",
        "mounts",
        "titles",
      ]

      def self.path(character)
        RBattlenet.uri("wow/character/#{character[:realm]}/#{character[:name]}?#{self.endpoints}")
      end

      def self.endpoints
        "fields=#{FIELDS.join("&fields=")}"
      end
    end
  end
end
