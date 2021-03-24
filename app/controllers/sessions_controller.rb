# frozen_string_literal: true

class SessionsController < ApplicationController
  
  def create
    if self.verify(email: params[:email], password: params[:password])
      redirect_to landing_url, notice: 'You have successfully Logged in!'
    else
      flash.now[:alert] = 'Email or password is invalid'
      render 'new'
    end
  end

  def destroy
    redirect_to root_url, notice: 'Logged out!'
  end
end
