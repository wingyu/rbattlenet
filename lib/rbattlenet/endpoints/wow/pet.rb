module RBattlenet
  module Wow
    class Pet < RBattlenet::Endpoints::Base
      def self.path(id)
        RBattlenet.uri("data/wow/pet/#{id}?namespace=static-")
      end

      def self.index_path
        RBattlenet.uri("data/wow/pet/index?namespace=static-")
      end
    end
  end
end
