class RemoveLendedBookIdFromReturnRequests < ActiveRecord::Migration[6.0]
  def change
    remove_column :return_requests, :lended_book_id, :integer
  end
end
