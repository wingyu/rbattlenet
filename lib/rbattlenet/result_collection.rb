require 'forwardable'

module RBattlenet
  class ResultCollection
    extend Forwardable

    attr_reader :results

    def initialize(response_type)
      @response_object = response_type == :hash ? HashResult : Result
      @results = []
      @status_codes = {}
    end

    def add(field, response)
      data = if response.code == 200
        result = Oj.load(response.body, mode: :compat, object_class: @response_object, symbol_keys: true) rescue nil
        result && (result.is_a?(Array) ? @response_object.new(data: result.size == 1 ? result.first : result) : result)
      end || @response_object.new(empty: true)

      status = @response_object.new
      status[:code] = response.code
      status[:timeout] = response.timed_out? && response.code != 200
      @status_codes[field] = status

      data[:field] = field
      @results << data

      data
    end

    def complete(results_needed)
      if @results.size == results_needed
        base_result = @results.find { |result| result[:field] == :itself }
        (@results - [base_result]).each{ |result| base_result << result }

        if @status_codes.size == 1
          base_result[:status_code] = @status_codes.values.first
        else
          base_result[:status_codes] = @status_codes
        end
        base_result
      end
    end

    def_delegators :results, :first, :last, :size
  end

  class Result < OpenStruct
    def <<(result)
      data = result.send(result.field)
      send("#{result.field}=", data.is_a?(self.class) && data.empty ? nil : (data || result))
    end
  end

  class HashResult < Hash
    def <<(result)
      data = result[result[:field]]
      self[result[:field]] = data.is_a?(Hash) && data[:empty] ? nil : (data || result)
    end
  end
end
