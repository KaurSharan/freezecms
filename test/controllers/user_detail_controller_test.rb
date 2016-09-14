require 'test_helper'

class UserDetailControllerTest < ActionController::TestCase
  test "should get user_detail" do
    get :user_detail
    assert_response :success
  end

end
