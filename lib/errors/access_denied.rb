module Errors
    class AccessDenied < Errors::ApplicationError
      attr_reader :subject, :action, :detail, :message_key
  
      def initialize error, message: nil
        @subject = error.subject.underscore
        @detail = error.class.to_s.split("::")[1].underscore
        @action = error.action
        @message_key = message || :default
        @errors = serialize
      end
  
      def serialize
        [
          {
            resource: resource,
            action: action,
            code: code,
            message: message
          }
        ]
      end
  
      private
      def message
        I18n.t message_key,
          scope: [:api, :errors, :messages, :access_denied],
          resource: resource
      end
  
      def resource
        I18n.t subject,
          locale: :api,
          scope: [:api, :errors, :resources],
          default: subject
      end
  
      def code
        I18n.t detail,
          locale: :api,
          scope: [:api, :errors, :code],
          default: detail
      end
    end
end
