module RBattlenet
  module Wow
    class Guild
      def self.find(name, realm, fields = nil)
        name = RBattlenet.parse_spaces(name)
        fields = RBattlenet.parse_fields(fields)
        realm =  RBattlenet.parse_spaces(realm)
        options = RBattlenet.merge_options(fields)

        uri = RBattlenet.
          base_uri("#{GAME}/guild/#{realm}/#{name}")

        RBattlenet.get(uri, options)
      end
    end
  end
end

