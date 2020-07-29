require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
    sign_out users(:one)
    get '/users/sign_in'
    sign_in users(:book_manager)
    post user_session_url
    

    get '/users/sign_in'
    sign_in users(:one)
    post user_session_url

  end

  test "should show books" do
    get '/books'
    assert_response :success

    book = Book.first
    get book_path(book)
    assert_response :success
  end

  test "show lended list" do
    get '/books/lended_list'
    assert_response :success
  end
  test "show lend requests" do
    get '/books/lend_requests'
    assert_response :success
  end
  test "show return requests" do
    get '/books/lend_requests'
    assert_response :success
  end
  test "show searched index list" do
    get '/books/searched_index'
    assert_response :success
  end

  test "should create book" do
    sign_out users(:one)
    get '/users/sign_in'
    sign_in users(:book_manager)
    post user_session_url

    assert post '/books', params: {book: {title:"thirukural", author:"ajith", language: "tamil", publisher:"tamilan", description: "life", totalBooks:12}}
    assert_response :redirect
  end

  test "should update book" do
    sign_out users(:one)
    get '/users/sign_in'
    sign_in users(:book_manager)
    post user_session_url

    book = books(:one)
    #puts book.author
		#puts "book id(in book test): #{Book.first.id}"
    assert patch book_url(Book.first), params:{book: {title: "newTitle", author: "MyString", publisher: "MyString", language: "MyString", description: "MyText", totalBooks: 14, availableBooks: 14}} #new Title
    assert_response :redirect
  end

  test "should delete book" do
    sign_out users(:one)
    get '/users/sign_in'
    sign_in users(:book_manager)
    post user_session_url

    book = books(:one)
    assert delete book_url(book)
    assert_response :redirect
  end

  test "should lend book" do
    book = books(:one)
    assert get lend_book_path(book)
    assert_response :redirect
  end

  test "should return book" do
    lended_book = lended_books(:one)
    assert get return_book_path(lended_book)
    assert_response :redirect
  end

end
