class CreateLendRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :lend_requests do |t|
    	t.string :status
    	t.references :user
    	t.references :book
      	t.timestamps
    end
  end
end
