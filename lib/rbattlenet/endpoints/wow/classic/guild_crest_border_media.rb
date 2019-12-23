module RBattlenet
  module Wow
    module Classic
      class GuildCrestBorderMedia < RBattlenet::Endpoints::Base
        def self.path(id)
          RBattlenet.uri("data/wow/media/guild-crest/border/#{id}?namespace=static-classic-")
        end
      end
    end
  end
end
