class AddLendedBookIdToRequests < ActiveRecord::Migration[6.0]
  def change
  	add_column :requests, :lended_book_id, :integer, default: nil
  end
end
