class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
		t.string :status, null: false, default: "pending"
		t.string :type, null: false
    	t.references :user
    	t.references :book
      t.timestamps
    end
  end
end
