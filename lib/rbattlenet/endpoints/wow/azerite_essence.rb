module RBattlenet
  module Wow
    class AzeriteEssence < RBattlenet::Endpoints::Base
      def self.path(id)
        RBattlenet.uri("data/wow/azerite-essence/#{id}?namespace=static-")
      end

      def self.index_path
        RBattlenet.uri("data/wow/azerite-essence/index?namespace=static-")
      end
    end
  end
end
