class SessionsController < ApplicationController
        skip_before_action :authorize, only: [:new, :create]
    def new

    end

    def create
        user = User.find_by(username: params[:user][:username])
        
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            flash[:success] = "Thanks #{user.first_name}! You are all logged in. Now it is time for you to Tweet for freedom!"
            redirect_to new_tweet_path
        else
            flash[:warning] = "Invalid username or password"
            redirect_to login_path
        end
    end
end
