class IndexController < ApplicationController
    before_action :logged_in_user, :auth_check, only: %i[ landing ]
    def landing
    end
end
