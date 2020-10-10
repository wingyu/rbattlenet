module RBattlenet
  module Wow
    class Profile::ProtectedSummary < RBattlenet::Endpoints::Base
      def self.path(params)
        RBattlenet.uri("profile/user/wow/protected-character/#{params[:realm_id]}-#{params[:character_id]}?access_token=#{params[:token]}&namespace=profile-")
      end
    end
  end
end
