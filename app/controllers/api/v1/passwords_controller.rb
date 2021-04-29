class Api::V1::PasswordsController < ApplicationController

  def forget
    if params[:email].blank?
      render json: {error: "Email not present"}
    end

    user = User.find_by(email: params[:email])
    if user.present?
      user.generate_password_token!
      render json: {status: "ok"}, status: :ok
    else
        render json: {error: "Email not found"}, status: :not_found
    end
  end



  def reset
    token = params[:token].to_s

    if params[:email].blank?
       render json: {error: "Email not present"}
    end

    user = User.find_by(reset_password_token: token)
    if user.present? && user.password_token_valid?
      if user.reset_password!(params[:password])
        render json: {status: "ok"}, status: :ok
      else 
        render json: {error: user.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: {error: "Token has expired generate a new token"}, status: :unprocessable_entity
    end
  end

end
