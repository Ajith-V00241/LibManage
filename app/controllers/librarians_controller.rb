class LibrariansController < ApplicationController
	before_action :authenticate_user!
	def index

	end

	def books
		@books = Book.paginate(page: params[:page], per_page: 9)
	end

	def show #show book details
		@book = Book.find(params[:id])
	end

	

	private
	def book_params
		params.require(:book).permit(:title, :author, :publisher, :language, :description, :image, :totalBooks, :availableBooks)
	end

end
