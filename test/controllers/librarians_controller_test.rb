require 'test_helper'

class LibrariansControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    get '/users/sign_in'
    sign_in users(:book_manager)
    post user_session_url
  end

  test "should open librarian home page" do
    get "/librarians"
    assert_response :success
  end

  test "should show the books" do
    get "/librarians/books"
    assert_response :success
    get "/librarians/#{books(:one).id}"
    assert_response :success
  end
end
