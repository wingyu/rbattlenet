module RBattlenet
  module Wow
    class Profile::User < RBattlenet::Endpoints::Base
      def self.path(token)
        RBattlenet.uri("profile/user/wow?access_token=#{token}&namespace=profile-")
      end
    end
  end
end
