class AddImageToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :image, :string, default: "/assets/bookLogo.jpg"
  end
end
