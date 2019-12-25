module RBattlenet
  module Sc2
    class Static < RBattlenet::Endpoints::Base
      def self.path(id)
        RBattlenet.uri("sc2/static/profile/#{id}?")
      end
    end
  end
end
