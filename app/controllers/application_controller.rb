class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :date_of_membership, :totalcheckout, :phone, :address])
	end

	def after_sign_in_path_for(resource)
		if current_user.admin
			librarian_path
		else 
			books_path
		end
	end

	def after_sign_out_path_for(resource)
		'/'
	end
end
