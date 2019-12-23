module RBattlenet
  module Wow
    module Classic
      class PlayableClass < RBattlenet::Endpoints::Base
        def self.path(id)
          RBattlenet.uri("data/wow/playable-class/#{id}?namespace=static-classic-")
        end

        def self.index_path
          RBattlenet.uri("data/wow/playable-class/index?namespace=static-classic-")
        end
      end
    end
  end
end
