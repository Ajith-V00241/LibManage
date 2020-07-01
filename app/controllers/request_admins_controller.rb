class RequestAdminsController < ApplicationController
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
		book = Book.find(lendRequest.book_id)
		if book.availableBooks !=0
			book.update(availableBooks: book.availableBooks-1)
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
		@returnRequests =  ReturnRequest.all
		@books = Book.all
		@users = User.all
	end

	def returnRequestsPending
		@returnRequests =  LendRequest.where(status: "Pending")
		@books = Book.all
		@users = User.all
	end

	def returnRequestsApproved
		@returnRequests =  LendRequest.where(status: "Approved")
		@books = Book.all
		@users = User.all
	end

	def returnRequestsRejected
		@returnRequests =  LendRequest.where(status: "Rejected")
		@books = Book.all
		@users = User.all
	end

	def approveReturnRequest
		returnRequest = ReturnRequest.find(params[:id])
		book = Book.find(lendRequest.book_id)
		if book.totalBooks == book.availableBooks
			book.update(availableBooks: book.availableBooks+1)
			status = "Approved"
		else
			status = "Pending"
		end
		returnRequest.update(status: status)
		redirect_to return_all_requests_path, notice: "Request Approved"
	end

end
