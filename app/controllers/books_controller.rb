class BooksController < ApplicationController
	before_action :authenticate_user!
	def index
		@books = Book.all
	end
	
	def searchedIndex
		@book = Book.search(params[:search])
	end

	def show
		@book = Book.find(params[:id])
	end

	def thank

	end

	def lendedBooks
	    @lendedBooks=LendedBook.where(user_id: current_user.id)
	end

	def lend
		@book = Book.find_by(id: params[:id])
		@lendRequest = LendRequest.create(status: "Pending", user_id: current_user.id, book_id: params[:id])
		redirect_to '/books/thank'
	end

	def returnBook
		@lendedBook = LendedBook.find_by(id: params[:id])
		@lendedBook.update(status: "Returning")
		@returnRequest = ReturnRequest.create(status: "Pending", user_id: current_user.id, book_id: @lendedBook.book_id, lended_book_id: params[:id])
		
		redirect_to '/books/thank'
	end

	def lendRequests
		@lendRequests = LendRequest.where(user_id: current_user.id).order(:status)
		@books = Book.all

	end

	def returnRequests
		@returnRequests = ReturnRequest.where(user_id: current_user.id)
		@books = Book.all

	end


	private
	def book_params
		params.require(:book).permit(:title, :author, :publisher, :language, :description, :search)
	end
end
