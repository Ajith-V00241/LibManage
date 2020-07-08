class DropTables < ActiveRecord::Migration[6.0]
  def change
  	drop_table :lend_requests
  	drop_table :return_requests
  end
end
