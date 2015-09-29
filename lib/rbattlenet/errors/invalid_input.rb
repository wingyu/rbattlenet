require_relative './error'

module RBattlenet
  module Errors
    class InvalidInput < Error
      def initialize
        super("Only 2v2, 3v3, 5v5 and rbg can be accepted as inputs")
      end
    end
  end
end
