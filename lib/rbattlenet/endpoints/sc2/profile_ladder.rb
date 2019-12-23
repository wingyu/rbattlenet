module RBattlenet
  module Sc2
    class ProfileLadder < RBattlenet::Endpoints::Base
      def self.path(ladder)
        RBattlenet.uri(
          "sc2/profile/#{ladder[:region_id]}/#{ladder[:realm_id]}/#{ladder[:profile_id]}/ladder/#{ladder[:id]}?"
        )
      end
    end
  end
end
