module RBattlenet
  module Wow
    class PlayableClass::PvpTalentSlot < RBattlenet::Endpoints::Base
      def self.path(id)
        RBattlenet.uri("data/wow/playable-class/#{id}/pvp-talent-slots?namespace=static-")
      end
    end
  end
end
