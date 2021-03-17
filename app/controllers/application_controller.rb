class ApplicationController < ActionController::Base
    helper_method :logged_in_user, :reset_session
    def logged_in_user
        if session[:user_id]
            @logged_in_user = User.find(session[:user_id])
        else 
            @logged_in_user = nil
        end
    end

    def reset_session
        @_request.reset_session
    end
end
