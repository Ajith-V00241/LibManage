class AddLendedBookIdToReturnRequests < ActiveRecord::Migration[6.0]
  def change
    add_reference :return_requests, :lended_book, null: false, foreign_key: true
  end
end
