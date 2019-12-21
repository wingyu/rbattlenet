module RBattlenet
  module Sc2
    module Legacy
      class Ladder < RBattlenet::Endpoints::Base
        def self.path(ladder)
          RBattlenet.uri("sc2/legacy/ladder/#{ladder[:region_id]}/#{ladder[:id]}?")
        end
      end
    end
  end
end
