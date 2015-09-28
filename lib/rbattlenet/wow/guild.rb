module RBattlenet
  module Wow
    class Guild
      def self.find(name, realm, fields = nil)
        name = RBattlenet.parse_spaces(name)
        fields = RBattlenet.parse_fields(fields)
        realm =  RBattlenet.parse_spaces(realm)
        queries = RBattlenet.merge_queries(fields)

        uri = RBattlenet.
          base_uri("#{GAME}/guild/#{realm}/#{name}")

        RBattlenet.get(uri, queries)
      end
    end
  end
end

