class ChangeColumnInBooks < ActiveRecord::Migration[6.0]
  def change
    change_column :books, :title, :string, presence: true
  end
end
