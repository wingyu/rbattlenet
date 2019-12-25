module RBattlenet
  module Wow
    class AzeriteEssenceMedia < RBattlenet::Endpoints::Base
      def self.path(id)
        RBattlenet.uri("data/wow/media/azerite-essence/#{id}?namespace=static-")
      end
    end
  end
end
