module Security
  module Authentication
    include DataEncrption::OpenSSLApplicationEncrptionHelper
    extend ActiveSupport::Concern
    def verify(email:, password:)
      user = User.find_by_email(email)
      session[:user_id] = encrypt_data(data: user.id) if user&.authenticate(password)
    end

    def session_user
      User.select(:email,:name).find(decrypt_data(encrypted_data: session[:user_id])) if session[:user_id]
    end

    def reset_session
      @_request.reset_session
    end
  end

  module Authorization
    extend ActiveSupport::Concern
    def auth_check
      session_user = (User.find(session[:user_id]) if session[:user_id])
      redirect_to root_url, notice: 'Please Logged in!' if session_user.nil?
    end
  end
end
