class AddStatusToLendedBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :lended_books, :status, :string
  end
end
