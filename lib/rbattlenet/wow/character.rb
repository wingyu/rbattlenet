module RBattlenet
  module Wow
    class Character
      def self.find(name, realm, fields = nil)
        fields = RBattlenet.parse_fields(fields)
        realm =  RBattlenet.parse_spaces(realm)
        options = RBattlenet.merge_options([{fields: fields}])

        uri = RBattlenet.
          base_uri("#{GAME}/character/#{realm}/#{name}")

        RBattlenet.get(uri, options)
      end
    end
  end
end

