module Authenticate
  def current_user
    return @current_user if @current_user
    header = request.headers["Authorization"]
    return nil if header.nil?
    decoded = JsonWebToken.decode(header)
    
    @current_user = User.find(decoded[:user_id])
  rescue ActiveRecord::RecordNotFound
    # raise custom error
  rescue JWT::ExpiredSignature
    raise ExceptionHandler::ExpiredSignature, "Token as Expired Login again"
  end

  private
  def check_login
    render json: {"message":"No Authentication token"},status: :forbidden unless self.current_user
  end
end