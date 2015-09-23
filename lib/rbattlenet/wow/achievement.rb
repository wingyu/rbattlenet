module RBattlenet
  module Wow
    class Achievement
      def self.search(id)
        uri = RBattlenet.
          base_uri("#{GAME}/achievement/#{id}?")

        HTTParty.get(uri)
      end
    end
  end
end

