require 'test_helper'

class RequestAdminsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    get '/users/sign_in'
    sign_in users(:request_admin)
    post user_session_url
  end

  test "should show index page" do
    get request_admins_path
    assert_response :success
  end

  test "should show all requests" do
    get request_admin_path('lend')
    assert_response :success
    get request_admin_path('return')
    assert_response :success
  end
  test "should show Pending requests" do
    get pending_request_admin_path('lend')
    assert_response :success
    get pending_request_admin_path('return')
    assert_response :success
  end
  test "should show Approved requests" do
    get approved_request_admin_path('lend')
    assert_response :success
    get approved_request_admin_path('return')
    assert_response :success
  end
  test "should show Rejected requests" do
    get rejected_request_admin_path('lend')
    assert_response :success
    get rejected_request_admin_path('return')
    assert_response :success
  end

  test "should approved request" do
    assert get approve_lend_request_admin_path(requests(:one))
    assert_response :redirect
    assert get approve_return_request_admin_path(requests(:two))
    assert_response :redirect
  end

  test "should reject request" do
    assert get reject_lend_request_admin_path(requests(:one))
    assert_response :redirect
    #puts lended_books(:one).id
    assert get reject_return_request_admin_path(requests(:two))
    assert_response :redirect
  end
end
