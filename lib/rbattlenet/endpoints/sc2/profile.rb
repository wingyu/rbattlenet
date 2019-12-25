module RBattlenet
  module Sc2
    class Profile < RBattlenet::Endpoints::Base
      def self.path(profile)
        RBattlenet.uri("sc2/profile/#{profile[:region_id]}/#{profile[:realm_id]}/#{profile[:id]}?")
      end
    end
  end
end
