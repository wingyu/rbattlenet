module RBattlenet
  module Wow
    class Achievement < RBattlenet::Endpoints::Base
      def self.path(id)
        RBattlenet.uri("data/wow/achievement/#{id}?namespace=static-")
      end

      def self.index_path
        RBattlenet.uri("data/wow/achievement/index?namespace=static-")
      end
    end
  end
end
