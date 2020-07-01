class CreateReturnRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :return_requests do |t|
      	t.string :status
    	t.references :user
    	t.references :book
    	t.timestamps
    end
  end
end
