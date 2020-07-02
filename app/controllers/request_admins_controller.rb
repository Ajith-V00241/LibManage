class RequestAdminsController < ApplicationController
	before_action :authenticate_admin!
	def requestsIndex

	end

	def lendRequestsAll
		@lendRequests =  LendRequest.all
		@books = Book.all
		@users = User.all
	end

	def lendRequestsPending
		@lendRequests =  LendRequest.where(status: "Pending")
		@books = Book.all
		@users = User.all
	end

	def lendRequestsApproved
		@lendRequests =  LendRequest.where(status: "Approved")
		@books = Book.all
		@users = User.all
	end

	def lendRequestsRejected
		@lendRequests =  LendRequest.where(status: "Rejected")
		@books = Book.all
		@users = User.all
	end

	def approveLendRequest
		lendRequest = LendRequest.find(params[:id])
		user = User.find(lendRequest.user_id)
		book = Book.find(lendRequest.book_id)
		if book.availableBooks !=0
			book.update(availableBooks: book.availableBooks-1)
			user.update(totalcheckout: user.totalcheckout+1)
			@lendedBooks = LendedBook.create(name: book.title, username: user.name, date_of_lend: Date.today.to_s, user_id: user.id, book_id: book.id, status: "Holding")
			status = "Approved"
		else
			status = "Pending"
		end
		lendRequest.update(status: status)
		redirect_to lend_all_requests_path, notice: "Request Approved"
	end

	def rejectLendRequest
		lendRequest = LendRequest.find(params[:id])
		lendRequest.update(status: "Rejected")
		redirect_to lend_all_requests_path, notice: "Request Rejected"
	end




	def returnRequestsAll
		@returnRequests = ReturnRequest.all
		@books = Book.all
		@users = User.all
	end

	def returnRequestsPending
		@returnRequests =  ReturnRequest.where(status: "Pending")
		@books = Book.all
		@users = User.all
	end

	def returnRequestsApproved
		@returnRequests =  ReturnRequest.where(status: "Approved")
		@books = Book.all
		@users = User.all
	end

	def returnRequestsRejected
		@returnRequests =  ReturnRequest.where(status: "Rejected")
		@books = Book.all
		@users = User.all
	end

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
