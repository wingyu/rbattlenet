module RBattlenet
  module Wow
    class PowerType < RBattlenet::Endpoints::Base
      def self.path(id)
        RBattlenet.uri("data/wow/power-type/#{id}?namespace=static-")
      end

      def self.index_path
        RBattlenet.uri("data/wow/power-type/index?namespace=static-")
      end
    end
  end
end
