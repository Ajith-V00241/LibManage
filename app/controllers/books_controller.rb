class BooksController < ApplicationController
	before_action :authenticate_user!
	before_action -> { check_repeating_requests("lend") }, only: [:lend]
	before_action -> { check_repeating_requests("return") }, only:[:return]
	def index
		@books = Book.paginate(page: params[:page], per_page: 5)
		#render json:Book.all
	end

	def new
		@book = Book.new
	end

	def create
		@book = Book.new(book_params)
		if @book.valid?
			if @book.save 
				redirect_to librarian_path(@book.id), notice: "Book Added"
			end
		else 
			render :new
		end
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		@book = Book.find(params[:id])

		if @book.update(title: params[:book][:title], author: params[:book][:author], publisher: params[:book][:publisher], language: params[:book][:language], description: params[:book][:description], totalBooks: params[:book][:totalBooks], availableBooks: params[:book][:availableBooks])
			redirect_to librarian_path(@book), notice: "Book Updated"
		else
			render :edit
		end
	end

	def show
		@book = Book.find(params[:id])
	end

	def destroy
		Book.find(params[:id]).destroy
		redirect_to books_librarians_path, notice: "Book deleted"
	end

	


	def searched_index
		@books = Book.where('title LIKE ?', "%#{params[:search]}%").paginate(page: params[:page], per_page: 5)
	end

	def lended_list
	    @lended_books=LendedBook.where(user_id: current_user.id).where.not(status: "Returned").paginate(page: params[:page], per_page: 10)
	end
	def thank

	end
	def lend
		Request.create(status: "Pending", request_type: "lend", user_id: current_user.id, book_id: params[:id])
		redirect_to thank_books_path
	end

	def return
		lended_book = LendedBook.find(params[:id])
		lended_book.update(status: "Returning")
		request = Request.create(status: "Pending", request_type: "return", user_id: current_user.id, book_id: lended_book.book_id, lended_book_id: lended_book.id)
		
		redirect_to thank_books_path
	end

	def lend_requests
		@requests = Request.where(user_id: current_user.id, request_type: "lend").order(:status).paginate(page: params[:page], per_page: 10)
		@books = Book.all

	end

	def return_requests
		@requests = Request.where(user_id: current_user.id, request_type: "return").order(:status).paginate(page: params[:page], per_page: 10)
		@books = Book.all

	end


	private
	def book_params
		params.require(:book).permit(:title, :author, :publisher, :language, :description, :totalBooks, :availableBooks, :image)
	end

	def check_repeating_requests(request_type)
		repeating_requests = Request.where(book_id: params[:id], user_id: current_user.id, status: "Pending", request_type: request_type)
		if !repeating_requests.empty? 
			redirect_to books_path, notice: "Same Lending Request has been made Already"
		end
		if request_type=="lend"
			lended_books= LendedBook.where(book_id: params[:id], user_id: current_user.id, status: "Holding").or(LendedBook.where(book_id: params[:id], user_id: current_user.id, status: "Returning"))
			if !lended_books.empty?
				redirect_to books_path, notice: "Same Book is being hold by you"
			end
		end
	end
end
