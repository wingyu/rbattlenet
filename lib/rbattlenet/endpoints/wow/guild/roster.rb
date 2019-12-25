module RBattlenet
  module Wow
    class Guild::Roster < RBattlenet::Endpoints::Base
      def self.path(guild)
        RBattlenet.uri("data/wow/guild/#{guild[:realm]}/#{guild[:name]}/roster?namespace=profile-")
      end
    end
  end
end
