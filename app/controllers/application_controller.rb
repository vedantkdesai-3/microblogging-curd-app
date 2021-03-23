# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :logged_in_user
  after_action :audit_application

  def reset_session
    @_request.reset_session
  end

  def logged_in_user
    (User.find(session[:user_id]) if session[:user_id])
  end

  def auth_check
    session_user = (User.find(session[:user_id]) if session[:user_id])
    redirect_to root_url, notice: 'Please Logged in!' if session_user.nil?
  end

  def audit_application
    session_user = (User.find(session[:user_id]) if session[:user_id])
    if session_user
      HistoryWorker.perform_async(session_user.name, Time.now, controller_name, @_action_name)
    else
      HistoryWorker.perform_async('Non User Page', Time.now, controller_name, @_action_name)
    end
  end
end

