module RBattlenet
  module Wow
    module Classic
      class PlayableClassMedia < RBattlenet::Endpoints::Base
        def self.path(id)
          RBattlenet.uri("data/wow/media/playable-class/#{id}?namespace=static-classic-")
        end
      end
    end
  end
end
