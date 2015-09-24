module RBattlenet
  module Wow
    class Achievement
      def self.search(id)
        uri = RBattlenet.
          base_uri("#{GAME}/achievement/#{id}?")

        RBattlenet.get(uri)
      end
    end
  end
end

