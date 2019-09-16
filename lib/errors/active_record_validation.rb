module Errors
    class ActiveRecordValidation < Errors::ApplicationError
      attr_reader :record
  
      def initialize record
        @record = record
        @errors = serialize
      end
  
      def serialize full_messages: true
        messages = record.errors.to_hash full_messages
        record.errors.details.map do |field, details|
          detail = details.first[:error]
          message = messages[field].first
          ValidationErrorSerializer.new(record, field, detail, message).serialize
        end
      end
    end
end
