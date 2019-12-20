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

    class InvalidFieldsOption < Error
      def initialize
        super("Fields should be provided as an Array and should all be supported")
      end
    end

    class IndexNotSupported < Error
      def initialize
        super("Retrieving all entities of this endpoint is not supported")
      end
    end

    class FindNotSupported < Error
      def initialize
        super("Finding entities of this endpoint is not supported")
      end
    end
  end
end
