class Book < ApplicationRecord
	def self.search(search)
		if search
			Book.find_by(title: search)
		end
	end
end
