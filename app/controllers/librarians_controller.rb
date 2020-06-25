class LibrariansController < ApplicationController
	def index

	end

	def booksIndex
		@books = Book.all
	end
end
