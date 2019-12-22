module RBattlenet
  module Wow
    class MythicKeystoneDungeon < RBattlenet::Endpoints::Base
      def self.path(id)
        RBattlenet.uri("data/wow/mythic-keystone/dungeon/#{id}?namespace=dynamic-")
      end

      def self.index_path
        RBattlenet.uri("data/wow/mythic-keystone/dungeon/index?namespace=dynamic-")
      end
    end
  end
end
