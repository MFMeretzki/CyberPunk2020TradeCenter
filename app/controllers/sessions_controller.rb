class SessionsController < ApplicationController
	skip_before_action :authorize
	
  def new
  end

  def create
		if user = User.authenticate(params[:nick], params[:password])
			session[:user_id] = user.id
			session[:user_type] = user.user_type
			redirect_to home_url
		else
			redirect_to login_url, :alert => "Invalid user/password combination"
		end
  end

  def destroy
		session[:user_id] = nil
			session[:user_type] = nil
		redirect_to login_url, notice => "Logged out"
  end
	
	private
		
		def access_level
			0
		end
end
