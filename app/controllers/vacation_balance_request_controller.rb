class VacationBalanceRequestController < ApplicationController
  include VacationBalanceRequestHelper

  def index
    @vacation_balance_request = VacationBalanceRequest.new
  end

  def calculate
    @vacation_balance_request = VacationBalanceRequest.new(vacation_balance_request_params)
    @vacation_balance_request.valid?
    puts client
    first_thing = client.query("SELECT id, name FROM contact WHERE name ='Greg Dutcher'").first
    puts first_thing.name
    render action: 'index'
  end

  private
  def vacation_balance_request_params
    params.require(:vacation_balance_request).permit(:vacation_balance, :start_date, :end_date, :accrual_rate, :salesforce_text)
  end
end
