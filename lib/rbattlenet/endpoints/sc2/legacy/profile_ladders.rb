module RBattlenet
  module Sc2
    module Legacy
      class ProfileLadders < RBattlenet::Endpoints::Base
        def self.path(profile)
          RBattlenet.uri("sc2/legacy/profile/#{profile[:region_id]}/#{profile[:realm_id]}/#{profile[:id]}/ladders?")
        end
      end
    end
  end
end
