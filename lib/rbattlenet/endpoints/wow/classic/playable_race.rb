module RBattlenet
  module Wow
    module Classic
      class PlayableRace < RBattlenet::Endpoints::Base
        def self.path(id)
          RBattlenet.uri("data/wow/playable-race/#{id}?namespace=static-classic-")
        end

        def self.index_path
          RBattlenet.uri("data/wow/playable-race/index?namespace=static-classic-")
        end
      end
    end
  end
end
