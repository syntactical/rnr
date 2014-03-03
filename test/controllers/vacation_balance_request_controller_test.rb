require 'test_helper'

class VacationBalanceRequestControllerTest < ActionController::TestCase
  test "should get successful response on calculate" do
    get :calculate, {'vacation_balance_request' => {'vacation_balance' => '22',
                                                'start_date' => '2014/02/04',
                                                'end_date' => '2014/02/13',
                                                'accrual_rate' => '10'}}
    assert_response :success
  end

end
