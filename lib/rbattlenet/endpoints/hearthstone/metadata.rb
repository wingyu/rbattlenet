module RBattlenet
  module Hearthstone
    class Metadata < RBattlenet::Endpoints::Base
      def self.path(id)
        RBattlenet.uri("hearthstone/metadata/#{id}?")
      end

      def self.index_path
        RBattlenet.uri("hearthstone/metadata?")
      end
    end
  end
end
