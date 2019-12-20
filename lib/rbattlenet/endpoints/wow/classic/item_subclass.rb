module RBattlenet
  module Wow
    module Classic
      class ItemSubclass < RBattlenet::Endpoints::Base
        def self.path(subclass)
          RBattlenet.uri("data/wow/item-class/#{subclass[:class_id]}/item-subclass/#{subclass[:id]}?namespace=static-classic-")
        end
      end
    end
  end
end
