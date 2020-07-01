class UserAdminsController < ApplicationController
	def allUsers
		@users = User.all
	end

	def showUser
		@user = User.find(params[:id])
		@lendedBooks = LendedBook.where(username: @user.name)
	end
end
