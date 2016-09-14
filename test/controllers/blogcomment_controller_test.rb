require 'test_helper'

class BlogcommentControllerTest < ActionController::TestCase
  test "should get blogcomment" do
    get :blogcomment
    assert_response :success
  end

end
