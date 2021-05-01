class ApplicationController < ActionController::API
  include Authenticate
  include ExceptionHandler
end
