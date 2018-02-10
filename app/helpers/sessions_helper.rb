module SessionsHelper

	def check_access_level(lvl)
		ok = false
		if session[:user_type] != nil
			if session[:user_type] >= lvl
				ok = true
			end
		end
	end

end
