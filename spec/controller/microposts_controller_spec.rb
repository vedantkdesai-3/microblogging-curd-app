require 'rails_helper'

RSpec.describe MicropostsController, type: :controller do
  before do
    @user = User.create
    session[:user_id] = @user.id
  end

  describe 'responds to' do
    it 'create' do
      post :create, params: { following_user_id: 1 }
      expect(response.media_type).to eq 'text/html'
      expect(response.status).to eq 200
      expect(response.status).to include 'Micropost was successfully created.'
    end

    it 'create failed' do
      post :create, params: { following_user_id: nil }
      expect(response.status).to eq unprocessable_entity
    end

    it 'delete' do
      delete :destroy, params: { id: @follow.id }
      expect(response.media_type).to eq 'text/html'
      expect(response.status).to eq 200
      expect(response.status).to include 'Micropost was successfully destroyed.'
    end

    it 'create failed' do
      post :create, params: { following_user_id: nil }
      expect(response.status).to eq unprocessable_entity
    end

    it 'update' do
      delete :destroy, params: { id: @follow.id }
      expect(response.media_type).to eq 'text/html'
      expect(response.status).to eq 200
      expect(response.status).to include 'Micropost was successfully updated.'
    end

    it 'delete failed' do
      delete :destroy, params: { id: nil }
      expect(response.status).to eq unprocessable_entity
    end

    it 'index [load_page]' do
      get :index, params: { logged_in_user: 1 }
      expect(response.status).to eq 200
      expect(response.media_type).to eq 'text/html'
    end
  end
end
