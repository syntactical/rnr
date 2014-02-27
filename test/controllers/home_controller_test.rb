require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get calculate_vacation_days" do
    get :calculate, {'vacation_calculator' => {'name' => 'Michael',
                                                'start_date' => '02-04-2014',
                                                'end_date' => '02-13-2014',
                                                'accrual_rate' => '10',
                                                'create' => 'blah'}}
    assert_response :success
  end

end
