class AddColumns2ToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :totalBooks, :integer
    add_column :books, :availableBooks, :integer
  end
end
