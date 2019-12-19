module RBattlenet
  module Endpoints
    class Base
      def self.find(subjects)
        RBattlenet.get [subjects].flatten.map{ |subject| [path(subject), subject] } do
          yield if block_given?
        end
      end
    end
  end
end
