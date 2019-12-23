module RBattlenet
  module D3
    class CharacterClass < RBattlenet::Endpoints::Base
      def self.path(id)
        RBattlenet.uri("d3/data/hero/#{id}?")
      end
    end
  end
end
