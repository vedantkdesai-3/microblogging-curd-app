require 'rails_helper'

RSpec.describe UnfollowedController, type: :controller do
  before do
    @user = User.create
    session[:user_id] = @user.id
  end

  describe 'responds to' do
    it 'index [load_page]' do
      get :index
      expect(response.status).to eq 200
      expect(response.media_type).to eq 'text/html'
    end

    it 'index failed [load_page]' do
      session[:user_id] = nil
      get :index
      expect(response.status).to eq 200
      expect(response.media_type).to eq 'text/html'
    end
  end
end
