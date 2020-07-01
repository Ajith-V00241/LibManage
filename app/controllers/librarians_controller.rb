class LibrariansController < ApplicationController
	def index

	end

	def booksIndex
		@books = Book.all
	end

	def bookEdit
		@book = Book.find(params[:id])
	end

	def bookUpdate
		#raise params.inspect
		@book = Book.find(params[:id])
		@book.update(title: params[:book][:title], author: params[:book][:author], publisher: params[:book][:publisher], language: params[:book][:language], description: params[:book][:description])
		redirect_to librarian_book_path(@book), notice: "Book Updated"
	end

	def show
		@book = Book.find(params[:id])
	end

	def removeBook
		Book.find(params[:id]).destroy
		redirect_to librarian_books_path, notice: "Book deleted"
	end

	private
	def book_params
		params.require(:book).permit(:title, :author, :publisher, :language, :description, :search)
	end
end
