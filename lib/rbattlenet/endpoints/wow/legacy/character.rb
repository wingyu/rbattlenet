module RBattlenet
  module Wow
    module Legacy
      class Character < RBattlenet::Endpoints::Base
        def self.path(data)
          RBattlenet.uri("wow/character/#{data[:realm]}/#{data[:name]}?#{self.endpoints(data[:endpoints])}")
        end

        def self.endpoints(data)
          "fields=#{data.join("&fields=")}"
        end
      end
    end
  end
end
