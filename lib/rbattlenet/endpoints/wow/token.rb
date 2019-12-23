module RBattlenet
  module Wow
    class Token < RBattlenet::Endpoints::Base
      def self.index_path
        RBattlenet.uri("data/wow/token/index?namespace=dynamic-")
      end
    end
  end
end
