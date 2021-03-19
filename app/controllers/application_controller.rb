class ApplicationController < ActionController::Base

    helper_method :logged_in_user
    
    def reset_session
        @_request.reset_session
        @logged_in_user = nil
    end

    def logged_in_user
        if session[:user_id]
            @logged_in_user = User.find(session[:user_id])
        else 
            @logged_in_user = nil
        end
    end

    def auth_check 
        if @logged_in_user.nil?
            redirect_to root_url, notice: "Please Logged in!"
        end
    end
end
