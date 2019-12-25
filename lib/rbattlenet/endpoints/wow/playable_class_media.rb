module RBattlenet
  module Wow
    class PlayableClassMedia < RBattlenet::Endpoints::Base
      def self.path(id)
        RBattlenet.uri("data/wow/media/playable-class/#{id}?namespace=static-")
      end
    end
  end
end
