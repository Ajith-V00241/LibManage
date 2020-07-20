class RequestAdminsController < ApplicationController
	before_action :authenticate_user!

	def index

	end

	def show
		@type = params[:id]
		@requests =  Request.where(request_type: params[:id]).order(:status).paginate(page: params[:page], per_page: 5)
	end

	def pending
		@books = Book.all
		@users = User.all
		@type = params[:id]
		@requests = Request.where(request_type: params[:id], status: 'Pending').paginate(page: params[:page], per_page: 5)
	end

	def approved
		@books = Book.all
		@users = User.all
		@type = params[:id]
		@requests = Request.where(request_type: params[:id], status: 'Approved').paginate(page: params[:page], per_page: 5)
	end

	def rejected
		@books = Book.all
		@users = User.all
		@type = params[:id]
		@requests = Request.where(request_type: params[:id], status: 'Rejected').paginate(page: params[:page], per_page: 5)
	end

	def approve_lend
		request = Request.find(params[:id])
		book = Book.find(request.book_id)
		user = User.find(request.user_id)
		if book.availableBooks > 0
			book.update(availableBooks: book.availableBooks - 1)
			user.update(totalcheckout: user.totalcheckout+1)
			lended_books = LendedBook.create(name: book.title, username: user.name, date_of_lend: Date.today.to_s, user_id: user.id, book_id: book.id, status: "Holding")
			status = "Approved"
			request.update(status: status)
			redirect_to request_admin_path("lend"), notice: "Request Approved"
		else
			redirect_to request_admin_path("lend"), notice: "Book is not available right now"
		end
	end

	def reject_lend
		request = Request.find(params[:id])
		request.update(status: "Rejected")
		redirect_to request_admin_path("lend"), notice: "Request Rejected"
	end

	def approve_return
		request = Request.find(params[:id])
		book = Book.find(request.book_id)
		if book.totalBooks != book.availableBooks
			book.update(availableBooks: book.availableBooks+1)
			lended_book = LendedBook.find(request.lended_book_id)
			lended_book.update(status: "Returned")
			status = "Approved"
		else
			status = "Pending"
		end
		request.update(status: status)

		redirect_to request_admin_path("return"), notice: "Request Approved"
	end

	def reject_return
		request = Request.find(params[:id])
		lended_book = LendedBook.find(request.lended_book_id)
		lended_book.update(status: "Holding")
		request.update(status: "Rejected")
		redirect_to request_admin_path("return"), notice: "Request Rejected"
	end

#d-------------------------------
	
	def approveReturnRequest
		returnRequest = ReturnRequest.find(params[:id])
		book = Book.find(returnRequest.book_id)
		if book.totalBooks != book.availableBooks
			book.update(availableBooks: book.availableBooks+1)
			#LendedBook.find(returnRequest.lended_book_id).destroy
			lendedBooks = LendedBook.find(returnRequest.lended_book_id)
			lendedBooks.update(status: "Returned")
			status = "Approved"
		else
			status = "Pending"
		end
		returnRequest.update(status: status)

		redirect_to return_all_requests_path, notice: "Request Approved"
	end

	def rejectReturnRequest
		returnRequest = ReturnRequest.find(params[:id])
		lendedBook = LendedBook.find(returnRequest.lended_book_id)
		lendedBook.update(status: "Holding")
		returnRequest.update(status: "Rejected")
		redirect_to return_all_requests_path, notice: "Request Rejected"
	end


end
