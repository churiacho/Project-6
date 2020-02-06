class UsersController < ApplicationController
    before_action :get_user
    def index
    end
    
    def avatar
        @user.avatar.attach(params[:avatar])
    end

    private

    def get_user
        @user = current_user
    end
end
