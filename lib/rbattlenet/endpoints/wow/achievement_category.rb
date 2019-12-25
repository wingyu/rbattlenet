module RBattlenet
  module Wow
    class AchievementCategory < RBattlenet::Endpoints::Base
      def self.path(id)
        RBattlenet.uri("data/wow/achievement-category/#{id}?namespace=static-")
      end

      def self.index_path
        RBattlenet.uri("data/wow/achievement-category/index?namespace=static-")
      end
    end
  end
end
