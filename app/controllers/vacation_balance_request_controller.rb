class VacationBalanceRequestController < ApplicationController
  def index
    @vacation_balance_request = VacationBalanceRequest.new
  end

  def calculate
    @vacation_balance_request = VacationBalanceRequest.new(vacation_balance_request_params)
    @vacation_balance_request.valid?
    render action: 'index'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_vacation_balance_request
    @vacation_balance_request = VacationBalanceRequest.find(params[:id])
  end

  def vacation_balance_request_params
    params.require(:vacation_balance_request).permit(:vacation_balance, :start_date, :end_date, :accrual_rate)
  end
end
