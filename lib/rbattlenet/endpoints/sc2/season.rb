module RBattlenet
  module Sc2
    class Season < RBattlenet::Endpoints::Base
      def self.path(id)
        RBattlenet.uri("sc2/ladder/season/#{id}?")
      end
    end
  end
end
