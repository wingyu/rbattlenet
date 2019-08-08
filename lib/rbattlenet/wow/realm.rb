module RBattlenet
  module Wow
    class Realm
      def self.find
        uri = RBattlenet.base_uri("#{GAME}/realm/status")
        RBattlenet.get(uri)
      end
    end
  end
end
