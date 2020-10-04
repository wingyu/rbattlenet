module RBattlenet
  module Wow
    class Class < RBattlenet::Endpoints::Base
      def self.path(id)
        RBattlenet.uri("data/wow/playable-class/#{id}?namespace=static-")
      end

      def self.index_path
        RBattlenet.uri("data/wow/playable-class/index?namespace=static-")
      end
    end
  end
end
