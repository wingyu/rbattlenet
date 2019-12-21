module RBattlenet
  module D3
    class Account < RBattlenet::Endpoints::Base
      def self.path(id)
        RBattlenet.uri("d3/profile/#{id}/?")
      end
    end
  end
end
