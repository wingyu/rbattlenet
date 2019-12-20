module RBattlenet
  module Wow
    class Character < RBattlenet::Endpoints::Base
      def path(character)
        RBattlenet.uri("profile/wow/character/#{character[:realm]}/#{character[:name]}")
      end
    end
  end
end
