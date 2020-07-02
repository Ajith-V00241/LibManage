class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :set_no_cache
	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :date_of_membership, :totalcheckout, :phone, :address])
	end

	def after_sign_in_path_for(resource)
		if current_admin
			librarian_path
		elsif current_user
			books_path
		end
	end

	def after_sign_out_path_for(resource)
		'/'
	end

	def set_no_cache
    	response.headers['Cache-Control'] = 'no-cache, no-store, max-age=0, must-revalidate'
    	response.headers['Pragma'] = 'no-cache'
    	response.headers['Expires'] = 'Fri, 01 Jan 1990 00:00:00 GMT'
  	end


end
