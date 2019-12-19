module RBattlenet
  module Errors
    class Error < StandardError
      attr_reader :reason

      def initialize(reason)
        @reason = reason
      end
    end

    class InvalidInput < Error
      def initialize(message)
        super("Could not fetch data based on the provided input")
      end
    end

    class Unauthorized < Error
      def initialize
        super("Could not connect using the specified client credentials")
      end
    end

    class ConnectionError < Error
      def initialize
        super("Unable to connect or send HTTP request")
      end
    end

    class NoResultsError < Error
      def initialize
        super("Could not retrieve object, no requests have resolved yet")
      end
    end
  end
end
