module RBattlenet
  module D3
    class Skill < RBattlenet::Endpoints::Base
      def self.path(skill)
        RBattlenet.uri("d3/data/hero/#{skill[:class_slug]}/skill/#{skill[:id]}?")
      end
    end
  end
end
