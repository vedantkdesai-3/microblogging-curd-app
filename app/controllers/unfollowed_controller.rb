class UnfollowedController < ApplicationController
    before_action :logged_in_user, :auth_check, :set_follower, only: %i[ show create edit update destroy ]

    def index 
        @unfollowed_users = User.all
    end

end
