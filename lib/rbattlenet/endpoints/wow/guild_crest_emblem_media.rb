module RBattlenet
  module Wow
    class GuildCrestEmblemMedia < RBattlenet::Endpoints::Base
      def self.path(id)
        RBattlenet.uri("data/wow/media/guild-crest/emblem/#{id}?namespace=static-")
      end
    end
  end
end
