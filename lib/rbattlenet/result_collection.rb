require 'forwardable'

module RBattlenet
  class ResultCollection
    extend Forwardable

    attr_reader :results

    def initialize
      @results = []
    end

    def add(subject, field, response)
      data = if response.code == 200
        JSON.parse(response.body, object_class: Result)
      else
        EmptyResult.new(status_code: response.code, response: response)
      end

      data.status_code ||= 200
      data.source, data.field = subject, field
      @results << data
    end

    def complete(subject, results_needed)
      subject_results = @results.select{ |result| result.source == subject }
      if subject_results.size == results_needed
        @results.reject!{ |result| result.source == subject }

        if empty = subject_results.select{ |result| result.class == RBattlenet::EmptyResult }.first
          return empty
        end

        base_result = subject_results.select{ |result| result.field == :itself }.first
        (subject_results - [base_result]).each{ |result| base_result << result }

        @results << base_result
        base_result
      end
    end

    def_delegators :results, :first, :last, :size
  end

  class Result < OpenStruct
    def <<(result)
      send("#{result.field}=", result)
    end
  end

  class EmptyResult < Result; end
end
