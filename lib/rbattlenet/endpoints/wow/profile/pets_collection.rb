module RBattlenet
  module Wow
    class Profile::PetsCollection < RBattlenet::Endpoints::Base
      def self.path(token)
        RBattlenet.uri("profile/user/wow/collections/pets?access_token=#{token}&namespace=profile-")
      end
    end
  end
end
