module RBattlenet
  module D3
    class Follower < RBattlenet::Endpoints::Base
      def self.path(id)
        RBattlenet.uri("d3/data/follower/#{id}?")
      end
    end
  end
end
