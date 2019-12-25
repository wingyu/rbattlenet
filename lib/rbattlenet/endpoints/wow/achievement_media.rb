module RBattlenet
  module Wow
    class AchievementMedia < RBattlenet::Endpoints::Base
      def self.path(id)
        RBattlenet.uri("data/wow/media/achievement/#{id}?namespace=static-")
      end
    end
  end
end
