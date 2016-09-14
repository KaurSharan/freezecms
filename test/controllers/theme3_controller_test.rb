require 'test_helper'

class Theme3ControllerTest < ActionController::TestCase
  test "should get page3" do
    get :page3
    assert_response :success
  end

end
