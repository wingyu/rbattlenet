module RBattlenet
  module Endpoints
    class Base
      SUPPORTED_FIELDS = [:itself]

      def self.all
        raise RBattlenet::Errors::IndexNotSupported.new unless defined?(index_path)
        RBattlenet.get [[[[:itself, index_path]], :index]] {}
      end

      def self.find(subjects, fields: [:itself])
        raise RBattlenet::Errors::FindNotSupported.new unless defined?(path)

        if !fields.is_a? Array || (fields.map(&:to_sym) - SUPPORTED_FIELDS).any?
          raise RBattlenet::Errors::InvalidFieldsOption.new
        end

        payload = [subjects].flatten.map do |subject|
          subject_fields = [:itself] + fields + (subject[:fields] if subject.is_a?(Hash)).to_a
          [subject_fields.uniq.map{ |field| [field, send(field).path(subject)] }, subject]
        end

        RBattlenet.get payload do
          yield if block_given?
        end
      end
    end
  end
end
