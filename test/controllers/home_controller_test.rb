require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get calculate_vacation_days" do
    get :calculate_vacation_days
    assert_response :success
  end

end
