module RBattlenet
  module Wow
    module Classic
      class PowerType < RBattlenet::Endpoints::Base
        def self.path(id)
          RBattlenet.uri("data/wow/power-type/#{id}?namespace=static-classic-")
        end

        def self.index_path
          RBattlenet.uri("data/wow/power-type/index?namespace=static-classic-")
        end
      end
    end
  end
end
