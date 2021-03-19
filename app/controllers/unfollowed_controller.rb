class UnfollowedController < ApplicationController
    before_action :logged_in_user, :auth_check,only: %i[ show edit update destroy ]
    def index 
        @unfollowed_users = User.all
    end
end
