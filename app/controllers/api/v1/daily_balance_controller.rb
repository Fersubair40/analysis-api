class Api::V1::DailyBalanceController < ApplicationController
  before_action :check_login, only: [:create]

  def index
    today = DailyBalance.where(date: Date.today)
    total = DailyBalance.where(date: Date.today).sum(:balance)
    render json: {data: today, total_day_balance: total}, each_serializer:  DailyBalanceSerializer
  end

  def create
    # account = Account.first
    # record_exist = Account.find(account.id => params[:account_id]).where(daily_balance => [])
    @daily_balance = DailyBalance.new(daily_balance_params)

    if
      render json: DailyBalanceSerializer.new(@daily_balance).serializable_hash.to_json, status: :created
    else
      render json: {errors: @daily_balance.errors}, status: :unprocessable_entity
    end

  end

  private
  def daily_balance_params
    params.require(:daily_balance).permit(:balance, :account_id, :date)
  end

end
