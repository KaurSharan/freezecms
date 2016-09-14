require 'test_helper'

class PronameControllerTest < ActionController::TestCase
  test "should get proname" do
    get :proname
    assert_response :success
  end

end
