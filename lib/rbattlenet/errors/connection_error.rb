require_relative './error'

module RBattlenet
  module Errors
    class ConnectionError < Error
      def initialize
        super("Unable to connect to Battle.net API")
      end
    end
  end
end
