class Request < ApplicationRecord
	#validates :book_id, :uniqueness => {:scope => [:status, :user_id, :request_type]}
	belongs_to :user
	belongs_to :book
	belongs_to :lended_book, required: false

	
end
