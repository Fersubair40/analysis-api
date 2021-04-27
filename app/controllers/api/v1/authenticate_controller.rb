class Api::V1::AuthenticateController < ApplicationController

  def create
    @user = User.find_by_email(user_params[:email])
    if @user&.authenticate(user_params[:password])
      render json: {
        id: @user.id,
        email: @user.email,
        token: JsonWebToken.encode(user_id: @user.id)
      }, status: :ok
    else 
      render json: {message: "unathorized or invalid credentials"}, status: :unauthorized
    end
  end


  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
