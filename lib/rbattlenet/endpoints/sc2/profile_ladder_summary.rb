module RBattlenet
  module Sc2
    class ProfileLadderSummary < RBattlenet::Endpoints::Base
      def self.path(profile)
        RBattlenet.uri(
          "sc2/profile/#{profile[:region_id]}/#{profile[:realm_id]}/#{profile[:id]}/ladder/summary?"
        )
      end
    end
  end
end
