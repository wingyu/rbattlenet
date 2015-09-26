module RBattlenet
  module Wow
    class Guild
      def self.search(name, realm, field = nil)
        name = RBattlenet.parse_spaces(name)
        realm =  RBattlenet.parse_spaces(realm)
        options = RBattlenet.merge_options([{fields: field}])

        uri = RBattlenet.
          base_uri("#{GAME}/guild/#{realm}/#{name}")

        RBattlenet.get(uri, options)
      end
    end
  end
end

