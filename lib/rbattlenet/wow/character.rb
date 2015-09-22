module RBattlenet
  module Wow
    class Character
      def self.search(name, realm, field = nil)
        field = RBattlenet.parse_field(field)

        uri = RBattlenet.
          base_uri("#{GAME}/character/#{realm}/#{name}?fields=#{field}")
puts uri
        HTTParty.get(uri)
      end
    end
  end
end

