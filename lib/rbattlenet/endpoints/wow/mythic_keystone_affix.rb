module RBattlenet
  module Wow
    class MythicKeystoneAffix < RBattlenet::Endpoints::Base
      def self.path(id)
        RBattlenet.uri("data/wow/keystone-affix/#{id}?namespace=static-")
      end

      def self.index_path
        RBattlenet.uri("data/wow/keystone-affix/index?namespace=static-")
      end
    end
  end
end
