module RBattlenet
  module Errors
    class Error < StandardError
      attr_reader :reason

      def initialize(reason)
        @reason = reason
      end
    end
  end
end
