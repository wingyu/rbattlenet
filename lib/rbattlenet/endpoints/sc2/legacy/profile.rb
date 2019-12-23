module RBattlenet
  module Sc2
    module Legacy
      class Profile < RBattlenet::Endpoints::Base
        SUPPORTED_FIELDS = [:itself, :matches, :ladders]

        def self.path(profile)
          RBattlenet.uri("sc2/legacy/profile/#{profile[:region_id]}/#{profile[:realm_id]}/#{profile[:id]}?")
        end

        def self.matches
          RBattlenet::Sc2::Legacy::ProfileMatchHistory
        end

        def self.ladders
          RBattlenet::Sc2::Legacy::ProfileLadders
        end
      end
    end
  end
end
