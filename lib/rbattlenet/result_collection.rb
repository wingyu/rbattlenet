require 'forwardable'

module RBattlenet
  class ResultCollection
    extend Forwardable

    attr_reader :results

    def initialize
      @results = []
    end

    def <<(response)
      @results << if response.code == 200
        JSON.parse(response.body, object_class: Result)
      else
        EmptyResult.new(status_code: response.code, response: response)
      end
    end

    def_delegators :results, :first, :last, :size
  end

  class Result < OpenStruct
    def initialize
      super
      self.status_code = 200
    end
  end

  class EmptyResult < OpenStruct; end
end
