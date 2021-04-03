require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  before do
    @user = User.create
    session[:user_id] = @user.id
  end

  describe 'responds to' do
    it 'index [load_page]' do
      get :index
      expect(response.status).to eq 200
      expect(response.media_type).to eq 'text/html'
      expect(response.session[:user_id]).to eq nil
    end
  end
end
