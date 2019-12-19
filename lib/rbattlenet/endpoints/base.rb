module RBattlenet
  module Endpoints
    class Base
      SUPPORTED_FIELDS = [:itself]

      def self.find(subjects, fields: [:itself])
        if !fields.is_a? Array || (fields.symbolize_keys! - SUPPORTED_FIELDS).any?
          raise RBattlenet::Errors::InvalidFieldsOption.new
        end

        payload = [subjects].flatten.map do |subject|
          [(fields + [:itself]).uniq.map{ |field| [field, send(field).path(subject)] }, subject]
        end

        RBattlenet.get payload do
          yield if block_given?
        end
      end
    end
  end
end
