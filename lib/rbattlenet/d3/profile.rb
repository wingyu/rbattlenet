module RBattlenet
  module D3
    class Profile
      def self.find_career(battletag)
        uri = RBattlenet.base_uri("#{GAME}/profile/#{battletag}/")

        RBattlenet.get(uri)
      end
    end
  end
end
