module RBattlenet
  module Wow
    class GuildCrestMedia < RBattlenet::Endpoints::Base
      def self.index_path
        RBattlenet.uri("data/wow/guild-crest/index?namespace=static-")
      end
    end
  end
end
