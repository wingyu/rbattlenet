module RBattlenet
  module Sc2
    module Legacy
      class Rewards < RBattlenet::Endpoints::Base
        def self.path(id)
          RBattlenet.uri("sc2/legacy/data/rewards/#{id}?")
        end
      end
    end
  end
end
