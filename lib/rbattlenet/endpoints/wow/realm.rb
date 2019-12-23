module RBattlenet
  module Wow
    class Realm < RBattlenet::Endpoints::Base
      def self.path(id)
        RBattlenet.uri("data/wow/realm/#{id}?namespace=dynamic-")
      end

      def self.index_path
        RBattlenet.uri("data/wow/realm/index?namespace=dynamic-")
      end
    end
  end
end
