module RBattlenet
  module Sc2
    module Legacy
      class ProfileMatchHistory < RBattlenet::Endpoints::Base
        def self.path(profile)
          RBattlenet.uri("sc2/legacy/profile/#{profile[:region_id]}/#{profile[:realm_id]}/#{profile[:id]}/matches?")
        end
      end
    end
  end
end
