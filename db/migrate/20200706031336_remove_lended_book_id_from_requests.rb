class RemoveLendedBookIdFromRequests < ActiveRecord::Migration[6.0]
  def change
  	remove_column :requests, :lended_book_id, :integer
  end
end
