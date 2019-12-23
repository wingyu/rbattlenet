module RBattlenet
  module Wow
    class PlayableSpecialization < RBattlenet::Endpoints::Base
      def self.path(id)
        RBattlenet.uri("data/wow/playable-specialization/#{id}?namespace=static-")
      end

      def self.index_path
        RBattlenet.uri("data/wow/playable-specialization/index?namespace=static-")
      end
    end
  end
end
