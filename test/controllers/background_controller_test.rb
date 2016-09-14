require 'test_helper'

class BackgroundControllerTest < ActionController::TestCase
  test "should get background" do
    get :background
    assert_response :success
  end

end
