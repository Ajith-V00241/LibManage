class Book < ApplicationRecord

	has_many :lended_book, dependent: :destroy

	has_many :requests, dependent: :destroy
	before_create :set_available_books
	validate do 
		# puts "book id(in book model): #{self.id}"
		# puts "Available books(in book model): #{self.availableBooks}"
		# puts "Title(in book model): #{self.title}"
		if (self.availableBooks>self.totalBooks)
			self.errors.add(:availableBooks, "Should not be greater than Total Books")
		end
	end
	validates :title, presence: true
	validates :author, presence: true
	validates :publisher, presence: true
	validates :language, presence: true
	validates :description, presence: true

	def set_available_books
		self.availableBooks = self.totalBooks
	end

end
