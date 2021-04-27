class Api::V1::DailySummaryController < ApplicationController
  before_action :set_daily_summary, only: [:destroy]
  before_action :check_login, only: [:create, :destroy]
  # before_action :check_owner, only: [:destroy]



  def create
    daily_summary = current_user.daily_summaries.build(daily_summary_params)

    if daily_summary.save
      render json: daily_summary, status: 201
    else
      render json: {errors: daily_summary.errors}, status: 402
    end
  end

  def destroy
    @daily_summary.destroy
    head 204
  end

  private

  def set_daily_summary
    @daily_summary = DailySummary.find(params[:id])
  end

  def daily_summary_params
    params.require(:daily_summary).permit(:date)
  end

  def check_owner
    render json: {"message": "You don't have permission."}, status: :forbidden unless @user.id == current_user&.id
  end
end
