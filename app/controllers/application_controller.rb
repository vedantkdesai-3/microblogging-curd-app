# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery

  include Security::Authentication
  include Security::Authorization
  include Audit::Auditor

  helper_method :logged_in_user
  after_action :audit_application

  def logged_in_user
    (User.select(:id,:name,:email).find(session[:user_id]) if session[:user_id])
  end
  
end