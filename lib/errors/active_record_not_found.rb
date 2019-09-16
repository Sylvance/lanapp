module Errors
    class ActiveRecordNotFound < Errors::ApplicationError
      attr_reader :model, :field, :detail, :message_key
  
      def initialize error, message: nil
        @model = error.model.underscore
        @detail = error.class.to_s.split("::")[1].underscore
        @field = error.primary_key
        @message_key = message || :default
        @errors = serialize
      end
  
      def serialize
        [
          {
            resource: resource,
            field: field,
            code: code,
            message: message
          }
        ]
      end
  
      private
      def message
        I18n.t message_key,
          scope: [:api, :errors, :messages, :not_found],
          resource: resource
      end
  
      def resource
        I18n.t model,
          locale: :api,
          scope: [:api, :errors, :resources],
          default: model
      end
  
      def code
        I18n.t detail,
          locale: :api,
          scope: [:api, :errors, :code],
          default: detail
      end
    end
end
