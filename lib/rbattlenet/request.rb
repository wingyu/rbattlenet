module RBattlenet
  class Request
    def initialize
      @results = []
      @retried = {}
      @headers = {}
      @extra_requests_by_subject = {}

      # Limit concurrency to prevent hitting the API request per-second cap.
      @hydra = Typhoeus::Hydra.new(max_concurrency: RBattlenet.option(:concurrency))
      @headers['Authorization'] = "Bearer #{RBattlenet.option(:token)}" if RBattlenet.option(:token)
    end

    def get(subjects, block_given)
      subjects.each do |fields, subject|
        store = RBattlenet.option(:response_type) == :raw ? [] : RBattlenet::ResultCollection.new(RBattlenet.option(:response_type))
        perform_request(block_given, store, subject, fields, *fields.find { |name, klass| name == :itself }) do |subject, data|
          yield(subject, data) if block_given
        end
      end

      @hydra.run
      (@results.size == 1 ? @results.first : @results) unless block_given
    end

    private

    def perform_request(block_given, store, subject, fields, name, klass)
      uri = klass.is_a?(String) ? klass : klass.path(subject)
      request = Typhoeus::Request.new(Addressable::URI.parse(uri).normalize.to_s, headers: @headers, timeout: RBattlenet.option(:timeout), connecttimeout: RBattlenet.option(:timeout))

      request.on_complete do |response|
        if RBattlenet.option(:retries) > 0 && (@retried[uri] || 0) < RBattlenet.option(:retries) && ((response.code != 200 && response.timed_out?) || response.code == 429)
          @retried[uri] = (@retried[uri] || 0) + 1
          @hydra.queue response.request
        else
          fetch_fields = fields.size > 1 && name == :itself && response.code == 200

          if RBattlenet.option(:response_type) == :raw
            store << response

            if fetch_fields && subject.is_a?(Hash) && subject.key?(:timestamp)
              result = Oj.load(response.body, mode: :compat, object_class: Hash, symbol_keys: true) rescue nil
              fetch_fields = result && (!result[:last_login_timestamp] || result[:last_login_timestamp] > subject[:timestamp])
            end
          else
            result = store.add(name, response)
            if fetch_fields && subject.is_a?(Hash) && subject.key?(:timestamp)
              fetch_fields = !result[:last_login_timestamp] || result[:last_login_timestamp] > subject[:timestamp]
            end

            if !klass.is_a?(String) && klass::EAGER_CHILDREN && RBattlenet.option(:eager_children) && response.code == 200
              @extra_requests_by_subject[subject] = klass.get_children(@headers, store, response)
            end

            if !fetch_fields && (data = store.complete(fields.size + (@extra_requests_by_subject[subject] || 0)))
              subject[:skipped] = (name == :itself) if subject.is_a?(Hash) && fields.size > 1
              if block_given
                yield subject, data
                store = nil
              else
                @results << data
              end
            end
          end

          if fetch_fields
            fields.each do |field_name, field_class|
              next if field_name == :itself
              perform_request(block_given, store, subject, fields, field_name, field_class) do |subject, data|
                yield(subject, data) if block_given
              end
            end
          end
        end
      end

      @hydra.queue request
    end
  end
end
