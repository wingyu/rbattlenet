module RBattlenet
  module Wow
    class GuildCrestBorderMedia < RBattlenet::Endpoints::Base
      def self.path(id)
        RBattlenet.uri("data/wow/media/guild-crest/border/#{id}?namespace=static-")
      end
    end
  end
end
