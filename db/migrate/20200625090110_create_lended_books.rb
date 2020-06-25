class CreateLendedBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :lended_books do |t|
      t.string :name
      t.string :username
      t.datetime :date_of_lend
      t.references :user
      t.timestamps
    end
  end
end
