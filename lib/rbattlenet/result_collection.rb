require 'forwardable'

module RBattlenet
  class ResultCollection
    extend Forwardable

    attr_reader :results

    def initialize(response_type)
      @response_object = response_type == :hash ? HashResult : Result
      @empty_response_object = response_type == :hash ? EmptyHashResult : EmptyResult
      @results = []
    end

    def add(subject, field, response)
      data = if response.code == 200
        result = JSON.parse(response.body, object_class: @response_object) rescue nil
        result && (result.is_a?(Array) ? @response_object.new(data: result.size == 1 ? result.first : result) : result)
      end || @empty_response_object.new(status_code: response.code, timeout: response.timed_out?)

      data[:status_code] ||= 200
      data[:source], data[:field] = subject, field
      @results << data
    end

    def complete(subject, results_needed)
      subject_results = @results.group_by{ |result| result[:source] }[subject]
      if subject_results.size == results_needed
        @results.reject!{ |result| result[:source] == subject }
        base_result = subject_results.select{ |result| result[:field] == :itself }.first
        (subject_results - [base_result]).each{ |result| base_result << result }

        @results << base_result
        base_result
      end
    end

    def_delegators :results, :first, :last, :size
  end

  class Result < OpenStruct
    def <<(result)
      send("#{result.field}=", result.send(result.field) || result)
    end
  end

  class HashResult < Hash
    def <<(result)
      self[result[:field]] = result[result[:field]] || result
    end
  end

  class EmptyResult < Result; end
  class EmptyHashResult < HashResult; end
end
