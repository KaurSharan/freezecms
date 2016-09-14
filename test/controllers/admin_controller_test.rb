require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should get view" do
    get :view
    assert_response :success
  end

end
