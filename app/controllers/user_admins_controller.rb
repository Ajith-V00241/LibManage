class UserAdminsController < ApplicationController
	before_action :authenticate_user!
	def index
		@users = User.where(role: "member").paginate(page: params[:page], per_page: 10)
	end

	def show #show Users
		@user = User.find(params[:id])
		@lended_books = LendedBook.where(user_id: @user.id).paginate(page: params[:page], per_page: 10)
	end

	def destroy
		User.find(params[:id]).destroy
		redirect_to user_admins_path, notice: "User Has Been Removed"
	end

end
