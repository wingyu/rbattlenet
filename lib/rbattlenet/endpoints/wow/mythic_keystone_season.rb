module RBattlenet
  module Wow
    class MythicKeystoneSeason < RBattlenet::Endpoints::Base
      def self.path(id)
        RBattlenet.uri("data/wow/mythic-keystone/season/#{id}?namespace=dynamic-")
      end

      def self.index_path
        RBattlenet.uri("data/wow/mythic-keystone/season/index?namespace=dynamic-")
      end
    end
  end
end
