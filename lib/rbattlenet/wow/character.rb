module RBattlenet
  module Wow
    class Character
      def self.find(name, realm, field = nil)
        field = RBattlenet.parse_field(field)
        realm =  RBattlenet.parse_spaces(realm)
        options = RBattlenet.merge_options([{fields: field}])

        uri = RBattlenet.
          base_uri("#{GAME}/character/#{realm}/#{name}")

        RBattlenet.get(uri, options)
      end
    end
  end
end

