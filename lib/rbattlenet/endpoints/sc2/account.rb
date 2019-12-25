module RBattlenet
  module Sc2
    class Account < RBattlenet::Endpoints::Base
      def self.path(id)
        RBattlenet.uri("sc2/player/#{id}?")
      end
    end
  end
end
