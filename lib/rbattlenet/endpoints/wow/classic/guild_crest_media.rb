module RBattlenet
  module Wow
    module Classic
      class GuildCrestMedia < RBattlenet::Endpoints::Base
        def self.index_path
          RBattlenet.uri("data/wow/guild-crest/index?namespace=static-classic-")
        end
      end
    end
  end
end
