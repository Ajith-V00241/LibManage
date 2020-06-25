class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :date_of_membership, :datetime
    add_column :users, :totalcheckout, :integer
    add_column :users, :phone, :string
    add_column :users, :address, :text
  end
end
