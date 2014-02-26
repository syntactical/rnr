require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get calculate_vacation_days" do
    get (:calculate, {'vacation_calculator' => {name => 'Michael', start_date => nil, end_date => nil, accrual_rate => '10', create => 'blah'}})
    assert_response :success
  end

end
