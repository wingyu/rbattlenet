module RBattlenet
  module Wow
    class Race < RBattlenet::Endpoints::Base
      def self.path(id)
        RBattlenet.uri("data/wow/playable-race/#{id}?namespace=static-")
      end

      def self.index_path
        RBattlenet.uri("data/wow/playable-race/index?namespace=static-")
      end
    end
  end
end
