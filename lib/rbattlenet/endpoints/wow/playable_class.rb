module RBattlenet
  module Wow
    class PlayableClass < RBattlenet::Endpoints::Base
      SUPPORTED_FIELDS = [:itself, :talent_slots]

      def self.path(id)
        RBattlenet.uri("data/wow/playable-class/#{id}?namespace=static-")
      end

      def self.index_path
        RBattlenet.uri("data/wow/playable-class/index?namespace=static-")
      end

      def self.talent_slots
        RBattlenet::Wow::PlayableClass::PvpTalentSlot
      end
    end
  end
end
