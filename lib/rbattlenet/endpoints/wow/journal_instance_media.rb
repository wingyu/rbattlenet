module RBattlenet
  module Wow
    class JournalInstanceMedia < RBattlenet::Endpoints::Base
      def self.path(id)
        RBattlenet.uri("data/wow/media/journal-instance/#{id}?namespace=static-")
      end
    end
  end
end
