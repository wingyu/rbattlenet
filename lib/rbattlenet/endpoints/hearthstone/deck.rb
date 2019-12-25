module RBattlenet
  module Hearthstone
    class Deck < RBattlenet::Endpoints::Base
      def self.path(id)
        RBattlenet.uri("hearthstone/deck/#{id}?")
      end
    end
  end
end
