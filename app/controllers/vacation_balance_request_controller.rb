class VacationBalanceRequestController < ApplicationController
  include VacationBalanceRequestHelper

  def index
    @vacation_balance_request = VacationBalanceRequest.new
  end

  def calculate
    @vacation_balance_request = VacationBalanceRequest.new(vacation_balance_request_params)
    @vacation_balance_request.valid?
    first_thing = client.query("SELECT Name, pse__Start_Date__c, pse__Timecard_Header__r.pse__Total_Hours__c FROM pse__Timecard__c").first
    puts first_thing.Name
    puts first_thing.pse__Timecard_Header__r.pse__Total_Hours__c
    render action: 'index'
  end

  private
  def vacation_balance_request_params
    params.require(:vacation_balance_request).permit(:vacation_balance, :start_date, :end_date, :accrual_rate, :salesforce_text)
  end
end
