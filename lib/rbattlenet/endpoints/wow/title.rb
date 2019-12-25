module RBattlenet
  module Wow
    class Title < RBattlenet::Endpoints::Base
      def self.path(id)
        RBattlenet.uri("data/wow/title/#{id}?namespace=static-")
      end

      def self.index_path
        RBattlenet.uri("data/wow/title/index?namespace=static-")
      end
    end
  end
end
