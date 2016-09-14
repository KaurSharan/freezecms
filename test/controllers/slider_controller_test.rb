require 'test_helper'

class SliderControllerTest < ActionController::TestCase
  test "should get slider" do
    get :slider
    assert_response :success
  end

end
