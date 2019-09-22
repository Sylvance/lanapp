# frozen_string_literal: true

module Errors
  class ApplicationError < StandardError
    attr_reader :code, :message

    def initialize(code: nil, message: nil)
      @code = code
      @message = message
    end

    def serialize
      [
        { code: code, message: message }
      ]
    end

    def to_hash
      {
        success: false,
        errors: serialize
      }
    end
  end
end
