module RBattlenet
  module Wow
    class Class::Media < RBattlenet::Endpoints::Base
      def self.path(id)
        RBattlenet.uri("data/wow/media/playable-class/#{id}?namespace=static-")
      end
    end
  end
end
