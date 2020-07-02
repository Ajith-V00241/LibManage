class UserAdminsController < ApplicationController
	before_action :authenticate_admin!
	def allUsers
		@users = User.all
	end

	def showUser
		@user = User.find(params[:id])
		@lendedBooks = LendedBook.where(user_id: @user.id)
	end

	def removeUser
		User.find(params[:id]).destroy
		redirect_to all_users_path, notice: "User Has Been Removed"
	end

	def deleteUser

	end

end
