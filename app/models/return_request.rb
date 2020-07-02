class ReturnRequest < ApplicationRecord
	belongs_to :user
	belongs_to :book
	belongs_to :lended_book
end
