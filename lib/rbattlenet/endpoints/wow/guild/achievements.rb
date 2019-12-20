module RBattlenet
  module Wow
    class Guild::Achievements < RBattlenet::Endpoints::Base
      def self.path(guild)
        RBattlenet.uri("data/wow/guild/#{guild[:realm]}/#{guild[:name]}/achievements?namespace=profile-")
      end
    end
  end
end
