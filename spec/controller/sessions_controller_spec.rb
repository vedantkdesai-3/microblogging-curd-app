require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  before do
    @user = User.create
    session[:user_id] = @user.id
  end

  describe 'responds to' do
    it 'create' do
      post :create
      expect(response.media_type).to eq 'text/html'
      expect(response.status).to eq 200
      expect(response.status).to include 'You have successfully Logged in!'
    end

    it 'create failed' do
      session[:user_id] = nil
      post :create
      expect(response.media_type).to eq 'text/html'
      expect(response.status).to eq 200
      expect(response.status).to include 'Email or password is invalid'
    end

    it 'destroy failed' do
      delete :destroy
      expect(response.media_type).to eq 'text/html'
      expect(response.status).to eq 200
      expect(response.status).to include 'Logged out!'
    end
  end
end
