module RBattlenet
  module Wow
    class Guild < RBattlenet::Endpoints::Base
      SUPPORTED_FIELDS = [:itself, :members, :achievements]

      def self.path(guild)
        RBattlenet.uri("data/wow/guild/#{guild[:realm]}/#{guild[:name]}?namespace=profile-")
      end

      def self.members
        RBattlenet::Wow::Guild::Roster
      end

      def self.achievements
        RBattlenet::Wow::Guild::Achievements
      end
    end
  end
end
