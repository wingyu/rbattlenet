module RBattlenet
  module Wow
    class ItemSubclass < RBattlenet::Endpoints::Base
      def self.path(subclass)
        RBattlenet.uri("data/wow/item-class/#{subclass[:class_id]}/item-subclass/#{subclass[:id]}?namespace=static-")
      end
    end
  end
end
