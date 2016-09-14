require 'test_helper'

class SubMenuControllerTest < ActionController::TestCase
  test "should get sub_menu" do
    get :sub_menu
    assert_response :success
  end

end
