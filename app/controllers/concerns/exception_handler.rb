module ExceptionHandler
  extend ActiveSupport::Concern

  class DecodeError < StandardError; end
  class ExpiredSignature < StandardError; end
  class MissingSignature < StandardError; end

  included do
    rescue_from ExceptionHandler::DecodeError do
      render json: {
        message: "Access denied!. Invalid token supplied."
      }, status: :unauthorized
    end

    rescue_from ExceptionHandler::ExpiredSignature do
      render json: {
        message: "Access denied!. Token has expired."
      }, status: :unauthorized
    end

    rescue_from ExceptionHandler::MissingSignature do |_error|
      json_response!({message: "Access denied!. Token has expired."}, :unauthorized)
    end

  end
end