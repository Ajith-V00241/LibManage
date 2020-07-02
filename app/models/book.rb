class Book < ApplicationRecord
	has_many :lend_request, dependent: :destroy
	has_many :lended_book, dependent: :destroy
	has_many :return_request, dependent: :destroy


	def self.search(search)
		if search
			Book.find_by(title: search)
		end
	end

end
