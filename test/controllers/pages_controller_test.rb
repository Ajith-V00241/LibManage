require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest

  test "should get home" do
    get home_path
    assert_response :success
  end

  test "should redirect to login if not logged in" do
    user = User.first()
    get show_user_path(user.id)
    assert_response :redirect
  end

  test "should show users" do
    get '/users/sign_in'
    sign_in users(:one)
    post user_session_url

    user = User.first()
    get show_user_path(user.id)
    assert_response :success
  end
end
