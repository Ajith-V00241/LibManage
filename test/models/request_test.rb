require 'test_helper'

class RequestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @book = Book.first()
    @user = User.first()
    @lended_book = LendedBook.first()
  end

  test "should save correctly" do 
    request = Request.new(status: "Approved",request_type:"lend", user_id: @user.id, book_id: @book.id)
    assert request.save, "Lend Request Not saved correctly"
    request = Request.new(status: "Approved",request_type:"return", user_id: @user.id, book_id: @book.id, lended_book_id: @lended_book.id)
    assert request.save, "Return Request Not saved correctly"
    #puts @book.id
    #puts @user.id
  end

  test "should not save without missing data" do
    request = Request.new(status:"Approved", user_id:@user.id, book_id:@book.id)
    assert_not request.save, "Request saved without request type"
    request = Request.new(request_type:"lend", status:"Approved", book_id:@book.id)
    assert_not request.save, "Request saved without user id"
    request = Request.new(request_type:"lend", user_id:@user.id,status:"Approved")
    assert_not request.save, "Request saved without book id"

    request = Request.new(request_type:"return", user_id:@user.id,status:"Approved", book_id:@book.id)
    assert_not request.save, "Return Request saved without lended_book_id"
  end

  test "should not save with irrelevant data" do
    request = Request.new(status: "done",request_type:"lend", user_id: @user.id, book_id: @book.id)
    assert_not request.save, "Request saved irrelevant status other than Pending, Rejected, Approved"
    request = Request.new(status: "Pending",request_type:"done", user_id: @user.id, book_id: @book.id)
    assert_not request.save, "Request saved irrelevant request_type other than lend or return"
  end
end
