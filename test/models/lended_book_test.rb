require 'test_helper'

class LendedBookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @book = Book.first()
    @user = User.first()
    @lend_request = Request.first()
  end

  test "should create and update lend request correctly" do
    lended_book = LendedBook.new(name: @book.title, username: @user.name, date_of_lend: "2020-07-08 00:00:00", user_id: @user.id, book_id: @book.id, status: "Holding")
    assert lended_book.save, "has not saved correctly"
    assert lended_book.update(status: "Returned"), "has not updated correctly"
    #puts lended_book.id
  end

  test "should not create lend request missing data" do
    lended_book = LendedBook.new( username: @user.name, date_of_lend: "2020-07-08 00:00:00", user_id: @user.id, book_id: @book.id, status: "Holding")
    assert_not lended_book.save, "saved without book title"
    lended_book = LendedBook.new( name: @book.title, date_of_lend: "2020-07-08 00:00:00", user_id: @user.id, book_id: @book.id, status: "Holding")
    assert_not lended_book.save, "saved without user name"
    lended_book = LendedBook.new( username: @user.name, date_of_lend: "2020-07-08 00:00:00", name: @book.title, book_id: @book.id, status: "Holding")
    assert_not lended_book.save, "saved without user id"
    lended_book = LendedBook.new( username: @user.name, date_of_lend: "2020-07-08 00:00:00", user_id: @user.id, name: @book.title, status: "Holding")
    assert_not lended_book.save, "saved without book id"
    lended_book = LendedBook.new( username: @user.name, date_of_lend: "2020-07-08 00:00:00", user_id: @user.id, book_id: @book.id, name: @book.title)
    assert_not lended_book.save, "saved without status"
  end

  test "should not request with irrelevant data" do
    lended_book = LendedBook.new(name: @book.title, username: @user.name, date_of_lend: "2020-07-08 00:00:00", user_id: @user.id, book_id: @book.id, status: "done")
    assert_not lended_book.save, "should save with status as 'Returned' or 'Holding'"
    assert_not lended_book.update(status: "done"), " should save with status as 'Returned' or 'Holding'"
  end


end
