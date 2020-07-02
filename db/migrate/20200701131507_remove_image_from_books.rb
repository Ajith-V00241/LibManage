class RemoveImageFromBooks < ActiveRecord::Migration[6.0]
  def change
    remove_column :books, :image, :string, default: "/assets/bookLogo.jpg"
  end
end
