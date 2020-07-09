class PagesController < ApplicationController
	before_action :authenticate_user!, only: [:show_user]
  	def home
	end

	def show_user
		@user = current_user
	end

end
