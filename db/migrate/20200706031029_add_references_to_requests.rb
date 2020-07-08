class AddReferencesToRequests < ActiveRecord::Migration[6.0]
  def change
  	add_reference :requests, :lended_book, foreign_key: true
  end
end
