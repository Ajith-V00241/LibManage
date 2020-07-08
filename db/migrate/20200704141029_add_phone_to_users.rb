class AddPhoneToUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :phone, :string, null: false
  end
end
