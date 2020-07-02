class AddBookIdToLendedBooks < ActiveRecord::Migration[6.0]
  def change
    add_reference :lended_books, :book, null: false, foreign_key: true
  end
end
