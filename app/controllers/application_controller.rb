# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :logged_in_user
  after_action :audit_application

  def reset_session
    @_request.reset_session
    @logged_in_user = nil
  end

  def logged_in_user
    @logged_in_user = (User.find(session[:user_id]) if session[:user_id])
  end

  def auth_check
    redirect_to root_url, notice: 'Please Logged in!' if @logged_in_user.nil?
  end

  def audit_application
    if @logged_in_user
      HistoryWorker.perform_async(@logged_in_user.name, Time.now, controller_name, @_action_name)
    else
      HistoryWorker.perform_async('Non User Page', Time.now, controller_name, @_action_name)
    end
  end
end
