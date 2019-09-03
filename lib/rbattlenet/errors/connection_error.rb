require_relative './error'

module RBattlenet
  module Errors
    class ConnectionError < Error
      def initialize
        super("Unable to connect or send HTTP request")
      end
    end
  end
end
