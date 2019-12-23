module RBattlenet
  module Wow
    module Classic
      class GuildCrestEmblemMedia < RBattlenet::Endpoints::Base
        def self.path(id)
          RBattlenet.uri("data/wow/media/guild-crest/emblem/#{id}?namespace=static-classic-")
        end
      end
    end
  end
end
