class ApplicationController < ActionController::API
    include ActionController::Serialization
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    rescue_from ActiveRecord::RecordNotFound, with: :render_404
    rescue_from Errors::Runtime::StandardError,
        Errors::Runtime::ActionFailed,
        Errors::Runtime::ServiceFailed,
        with: :render_runtime_error_response

    before_action :authenticate_request

    attr_reader :current_user

    private

    def authenticate_request
        @current_user = AuthorizeApiRequest.call(request.headers).result

        render json: { error: 'Not Authorized' }, status: 401 unless @current_user
    end

    protected
    def render_unprocessable_entity_response error, status: :unprocessable_entity
        render json: Errors::ActiveRecordValidation.new(error.record).to_hash, status: status
    end

    def render_404 error, status: :not_found
        render json: Errors::ActiveRecordNotFound.new(error).to_hash, status: status
    end

    def render_runtime_error_response error, status: :bad_request
        render json: error.to_hash, status: status
    end
end
