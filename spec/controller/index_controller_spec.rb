require 'rails_helper'

RSpec.describe IndexController, type: :controller do
  before do
    @user = User.create
    session[:user_id] = @user.id
  end

  describe 'responds to' do
    it 'landing [load_page]' do
      get :landing
      expect(response.status).to eq 302
      expect(response.media_type).to eq 'text/html'
    end
  end
end
