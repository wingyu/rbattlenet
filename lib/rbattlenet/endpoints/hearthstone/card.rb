module RBattlenet
  module Hearthstone
    class Card < RBattlenet::Endpoints::Base
      def self.path(params)
        if (params.is_a?(String) && slug = params) || (slug = params[:slug])
          RBattlenet.uri("hearthstone/cards/#{slug}?")
        else
          RBattlenet.uri("hearthstone/cards?#{URI.encode_www_form(params)}&")
        end
      end
    end
  end
end
