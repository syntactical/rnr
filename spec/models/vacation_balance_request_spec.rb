require 'spec_helper'

describe VacationBalanceRequest do

  it 'should be valid' do
    vacation_balance_request = FactoryGirl.build(:vacation_balance_request)

    vacation_balance_request.should be_valid
  end

  it 'should not be valid' do
    vacation_balance_request = FactoryGirl.build(:vacation_balance_request, start_date: '02-01-2014', end_date: '01-28-2014')

    vacation_balance_request.should_not be_valid
  end
end