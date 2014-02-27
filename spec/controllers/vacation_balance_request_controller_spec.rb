require 'spec_helper'

describe VacationBalanceRequestController do

  it 'should instantiate a new empty VacationBalanceRequest' do
    get :index
    assigns(:vacation_balance_request).should be_a(VacationBalanceRequest)
  end
end