require 'test_helper'

class SubmenuControllerTest < ActionController::TestCase
  test "should get submenu" do
    get :submenu
    assert_response :success
  end

end
