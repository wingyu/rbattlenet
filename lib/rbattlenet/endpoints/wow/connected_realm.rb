module RBattlenet
  module Wow
    class ConnectedRealm < RBattlenet::Endpoints::Base
      def self.path(id)
        RBattlenet.uri("data/wow/connected-realm/#{id}?namespace=dynamic-")
      end

      def self.index_path
        RBattlenet.uri("data/wow/connected-realm/index?namespace=dynamic-")
      end
    end
  end
end
