module RBattlenet
  module Wow
    class Character::Soulbinds < RBattlenet::Endpoints::Base
      def self.path(character)
        RBattlenet.uri("profile/wow/character/#{character[:realm]}/#{character[:name]}/soulbinds?namespace=profile-")
      end
    end
  end
end
