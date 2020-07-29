require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should save book" do
    book = Book.new(title: "title", author:"author", publisher:"publisher", language:"language", description:"description", totalBooks:1, availableBooks:1 )
    assert book.save ,"had not saved correctly"
  end
  test "should not save book with missing data" do
    book = Book.new(author:"author", publisher:"publisher", language:"language", description:"description", totalBooks:1, availableBooks:1 )
    assert_not book.save ,"saved with no title"
    book = Book.new(title:"title", publisher:"publisher", language:"language", description:"description", totalBooks:1, availableBooks:1 )
    assert_not book.save ,"saved with no author"
    book = Book.new(author:"author", title:"title", language:"language", description:"description", totalBooks:1, availableBooks:1 )
    assert_not book.save ,"saved with no publisher"
    book = Book.new(author:"author", publisher:"publisher", title:"title", description:"description", totalBooks:1, availableBooks:1 )
    assert_not book.save ,"saved with no language"
    book = Book.new(author:"author", publisher:"publisher", language:"language", title:"title", totalBooks:1, availableBooks:1 )
    assert_not book.save ,"saved with no description"
    book = Book.new(author:"author", publisher:"publisher", language:"language", description:"description", title:"title", availableBooks:1 )
  end

  test "should not have different total and available number of books" do
    book =Book.create(title:"title",author:"author", publisher:"publisher", language:"language", description:"description", totalBooks:1, availableBooks:2)
    assert_not book.save ,"saved with different total and available number of books"
  end

  test "should not have different total books less than available number of books" do
    book =Book.create(title:"title",author:"author", publisher:"publisher", language:"language", description:"description", totalBooks:11)
    assert_not book.update(totalBooks: 12, availableBooks: 13),"saved with total books less than available number of books"
  end
end
