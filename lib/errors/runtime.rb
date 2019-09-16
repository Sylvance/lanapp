module Errors
    module Runtime
      class StandardError < Errors::ApplicationError
        attr_reader :type, :detail
  
        def initialize type, detail
          @type, @detail = type, detail
          scope = i18n_scope
          error = I18n.t detail, scope: scope, default: translation_missing(detail ,scope)
          @code = error[:code]
          @message = error[:message]
        end
  
        private
        def i18n_scope
          backtrace = caller 0, 5
          matches_file = backtrace.last.match(file_path_regex) || backtrace[2].match(file_path_regex)
          file_path = matches_file[0]
          file_path.split(%r|/|)[3..-1].map {|e| e.gsub file_suffix, ""}
        end
  
        def file_path_regex
          case type
          when :controller
            /\/app\/(controllers)\/.*\.rb/
          when :service
            /\/app\/(services)\/.*\.rb/
          end
        end
  
        def file_suffix
          case type
          when :controller
            %r|_controller.rb|
          when :service
            %r|_service.rb|
          end
        end
  
        def translation_missing detail, scope
          prefix_msg = "translation missing: #{scope.push(detail.to_s).join('.')}"
          {
            code: "#{prefix_msg}.code",
            message: "#{prefix_msg}.message"
          }
        end
      end
  
      class ActionFailed < Errors::Runtime::StandardError
        def initialize detail
          super :controller, detail
        end
      end
  
      class ServiceFailed < Errors::Runtime::StandardError
        def initialize detail
          super :service, detail
        end
      end
    end
end
