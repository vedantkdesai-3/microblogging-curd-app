class UnfollowedController < ApplicationController
    before_action :logged_in_user, :auth_check, only: %i[ index ]

    def index 
        @unfollowed_users = User.where.not(:id => @logged_in_user.id)
                                .where.not(:id => Follow.select(:following_user_id).where(:user_id => @logged_in_user.id))
            
    end

end
