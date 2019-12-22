module RBattlenet
  module Wow
    class MythicKeystonePeriod < RBattlenet::Endpoints::Base
      def self.path(id)
        RBattlenet.uri("data/wow/mythic-keystone/period/#{id}?namespace=dynamic-")
      end

      def self.index_path
        RBattlenet.uri("data/wow/mythic-keystone/period/index?namespace=dynamic-")
      end
    end
  end
end
