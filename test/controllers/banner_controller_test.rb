require 'test_helper'

class BannerControllerTest < ActionController::TestCase
  test "should get banner" do
    get :banner
    assert_response :success
  end

end
