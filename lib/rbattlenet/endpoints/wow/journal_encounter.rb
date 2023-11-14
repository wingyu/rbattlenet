module RBattlenet
  module Wow
    class JournalEncounter < RBattlenet::Endpoints::Base
      def self.path(id)
        RBattlenet.uri("data/wow/journal-encounter/#{id}?namespace=static-")
      end

      def self.index_path
        RBattlenet.uri("data/wow/journal-encounter/index?namespace=static-")
      end
    end
  end
end
