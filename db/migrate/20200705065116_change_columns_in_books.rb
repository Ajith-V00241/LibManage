class ChangeColumnsInBooks < ActiveRecord::Migration[6.0]
  def change
  	change_column :books, :title, :string, unique: true
  	change_column :books, :author, :string, null: false
  	change_column :books, :publisher, :string, null: false
  	change_column :books, :language, :string, null: false
  	change_column :books, :description, :string, null: false
  	change_column :books, :totalBooks, :integer, default: 0
  	change_column :books, :availableBooks, :integer, default: 0
  	change_column :books, :image, :string, default: "/assets/bookLogo.jpg"
  end
end
