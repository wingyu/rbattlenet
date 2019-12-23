module RBattlenet
  module Wow
    class Mount < RBattlenet::Endpoints::Base
      def self.path(id)
        RBattlenet.uri("data/wow/mount/#{id}?namespace=static-")
      end

      def self.index_path
        RBattlenet.uri("data/wow/mount/index?namespace=static-")
      end
    end
  end
end
