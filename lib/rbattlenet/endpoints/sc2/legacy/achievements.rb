module RBattlenet
  module Sc2
    module Legacy
      class Achievements < RBattlenet::Endpoints::Base
        def self.path(id)
          RBattlenet.uri("sc2/legacy/data/achievements/#{id}?")
        end
      end
    end
  end
end
