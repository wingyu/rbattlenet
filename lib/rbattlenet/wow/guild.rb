module RBattlenet
  module Wow
    class Guild
      def self.find(name:, realm:, fields: nil)
        fields = RBattlenet.parse_fields(fields)
        uri = RBattlenet.base_uri("#{GAME}/guild/#{realm}/#{name}")
        RBattlenet.get(uri, fields)
      end
    end
  end
end
