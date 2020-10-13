module RBattlenet
  module Wow
    class Profile::MountsCollection < RBattlenet::Endpoints::Base
      def self.path(token)
        RBattlenet.uri("profile/user/wow/collections/mounts?access_token=#{token}&namespace=profile-")
      end
    end
  end
end
