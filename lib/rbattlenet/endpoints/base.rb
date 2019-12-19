module RBattlenet
  module Endpoints
    class Base
      def self.find(subjects)
        RBattlenet.get [subjects].flatten.map{ |subject| [path(subject), subject] }
      end
    end
  end
end
