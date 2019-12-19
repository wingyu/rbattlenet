module RBattlenet
  module Wow
    class Guild < RBattlenet::Endpoints::Base
      SUPPORTED_FIELDS = [:itself, :roster, :achievements]

      def self.path(guild)
        RBattlenet.uri("data/wow/guild/#{guild[:realm]}/#{guild[:name]}?namespace=profile-")
      end
    end
  end
end
