class ChangePhoneInUsers < ActiveRecord::Migration[6.0]
  def change
  	change_column :users, :phone, :string, unique: true, null: false
  end
end
