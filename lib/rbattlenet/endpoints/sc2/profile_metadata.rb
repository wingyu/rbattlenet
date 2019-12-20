module RBattlenet
  module Sc2
    class ProfileMetadata < RBattlenet::Endpoints::Base
      def self.path(profile)
        RBattlenet.uri("sc2/metadata/profile/#{profile[:region_id]}/#{profile[:realm_id]}/#{profile[:id]}?")
      end
    end
  end
end
