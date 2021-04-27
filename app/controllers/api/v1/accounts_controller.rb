class Api::V1::AccountsController < ApplicationController
  before_action :set_account, only: [:show]
  before_action :check_login, only: [:create, :show]

  def create
    account = current_user.accounts.build(account_params)
    if account.save
      render json: AccountSerializer.new(account).serializable_hash.to_json, status: :created
    else
      render json: {errors: account.errors}, status: :unprocessable_entity
    end
  end

  def show
    render json: AccountSerializer.new(@account).serializable_hash.to_json
  end


  private
  def account_params
    params.require(:account).permit(:name, :account_type)
  end

  def set_account
    @account = Account.find(params[:id])
  end
end
