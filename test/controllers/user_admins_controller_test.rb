require 'test_helper'

class UserAdminsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  
  def setup
    get '/users/sign_in'
    sign_in users(:book_manager)
    post user_session_url
  end

  test "should_show_users" do
    get user_admins_path
    assert_response :success 
    get user_admin_path(users(:one))
    assert_response :success
  end

  test "should_destroy_user" do
    assert delete "/user_admins/#{users(:one).id}"
    assert_response :redirect
  end
end
