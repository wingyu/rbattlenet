module RBattlenet
  module Endpoints
    class Base
      SUPPORTED_FIELDS = [:itself]
      EAGER_CHILDREN = false

      def self.all
        raise RBattlenet::Errors::IndexNotSupported.new unless defined?(index_path)
        RBattlenet::Request.new.get([[[[:itself, index_path]], :index]], block_given?) do |subject, data|
          yield(subject, data) if block_given?
        end
      end

      def self.search(filters = {})
        raise RBattlenet::Errors::SearchNotSupported.new unless defined?(search_path)

        headers = {}
        headers['Authorization'] = "Bearer #{RBattlenet.option(:token)}" if RBattlenet.option(:token)

        first = Typhoeus.get(build_search_uri(filters, 1), headers: headers, timeout: RBattlenet.option(:timeout))
        data = Oj.load(first.body, mode: :compat, object_class: Hash, symbol_keys: true)
        results = data[:results] || []
        page_count = data[:pageCount] || 1

        if page_count > 1
          hydra = Typhoeus::Hydra.new(max_concurrency: RBattlenet.option(:concurrency))
          mutex = Mutex.new

          (2..page_count).each do |page|
            req = Typhoeus::Request.new(build_search_uri(filters, page), headers: headers, timeout: RBattlenet.option(:timeout))
            req.on_complete do |resp|
              page_data = Oj.load(resp.body, mode: :compat, object_class: Hash, symbol_keys: true)
              mutex.synchronize { results.concat(page_data[:results] || []) }
            end
            hydra.queue(req)
          end
          hydra.run
        end

        if block_given?
          results.each { |r| yield r }
        else
          results
        end
      end

      def self.find(subjects, fields: [:itself], initial_field: :itself)
        raise RBattlenet::Errors::FindNotSupported.new unless defined?(path)

        if !fields.is_a? Array || (fields.map(&:to_sym) - SUPPORTED_FIELDS).any?
          raise RBattlenet::Errors::InvalidFieldsOption.new
        end

        payload = [subjects].flatten.map do |subject|
          subject_fields = [:itself] + fields + (subject[:fields] if subject.is_a?(Hash)).to_a
          [subject_fields.uniq.map{ |field| [field, send(field)] }, subject]
        end

        RBattlenet::Request.new.get(payload, block_given?, initial_field) do |subject, data|
          yield(subject, data) if block_given?
        end
      end

      def self.build_search_uri(filters, page)
        params = filters.map { |k, v| "#{k}=#{CGI.escape(v.to_s)}" }.join("&")
        uri = "#{search_path}&#{params}&_page=#{page}"
        Addressable::URI.parse(uri).normalize.to_s
      end
      private_class_method :build_search_uri
    end
  end
end
