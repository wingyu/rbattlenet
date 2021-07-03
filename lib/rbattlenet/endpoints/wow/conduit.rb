module RBattlenet
  module Wow
    class Conduit < RBattlenet::Endpoints::Base
      def self.path(id)
        RBattlenet.uri("data/wow/covenant/conduit/#{id}?namespace=static-")
      end

      def self.index_path
        RBattlenet.uri("data/wow/covenant/conduit/index?namespace=static-")
      end
    end
  end
end
