module RBattlenet
  module Wow
    class Region < RBattlenet::Endpoints::Base
      def self.path(id)
        RBattlenet.uri("data/wow/region/#{id}?namespace=dynamic-")
      end

      def self.index_path
        RBattlenet.uri("data/wow/region/index?namespace=dynamic-")
      end
    end
  end
end
