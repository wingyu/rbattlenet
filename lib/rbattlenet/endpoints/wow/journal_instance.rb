module RBattlenet
  module Wow
    class JournalInstance < RBattlenet::Endpoints::Base
      def self.path(id)
        RBattlenet.uri("data/wow/journal-instance/#{id}?namespace=static-")
      end

      def self.index_path
        RBattlenet.uri("data/wow/journal-instance/index?namespace=static-")
      end
    end
  end
end
