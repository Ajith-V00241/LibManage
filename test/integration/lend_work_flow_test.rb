require 'test_helper'

class LendWorkFlowTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    get '/users/sign_in'
    sign_in users(:one)
    post user_session_url
  end

  test "should_show_books" do
    get "/books"
    assert_response :success
    assert_select "div.container" do |element|
      element.each do
        assert_select "a h3", /[a-zA-Z]+/
      end
    end
  end

  test "should_show_book" do
    get "/books/#{books(:one).id}"
    assert_response :success
    assert_select "div.showDetails table.bookDetails tr" do |element| 
      element.each do
        assert_select "td",/[a-zA-z:]+/
      end
    end
  end

  


end
