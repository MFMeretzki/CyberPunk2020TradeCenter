class ApplicationController < ActionController::Base
	before_action :authorize
  protect_from_forgery with: :exception
	
		def authorize
			ok = true
			user = User.find_by_id(session[:user_id])
			if user == nil
				ok = false
			elsif user[:user_type] == nil
				ok = false
			elsif user[:user_type] < access_level
				ok = false
			end
			
			unless ok
				redirect_to login_url, :notice => "Please log in."
			end
		end
	
	private
	
		def access_level
			0
		end
end
