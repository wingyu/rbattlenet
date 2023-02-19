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

      def self.find(subjects, fields: [:itself])
        raise RBattlenet::Errors::FindNotSupported.new unless defined?(path)

        if !fields.is_a? Array || (fields.map(&:to_sym) - SUPPORTED_FIELDS).any?
          raise RBattlenet::Errors::InvalidFieldsOption.new
        end

        payload = [subjects].flatten.map do |subject|
          subject_fields = [:itself] + fields + (subject[:fields] if subject.is_a?(Hash)).to_a
          [subject_fields.uniq.map{ |field| [field, send(field)] }, subject]
        end

        RBattlenet::Request.new.get(payload, block_given?) do |subject, data|
          yield(subject, data) if block_given?
        end
      end
    end
  end
end
