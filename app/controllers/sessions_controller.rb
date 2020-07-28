class SessionsController < ApplicationController

    def new

    end

    def create
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            flash[:success] = "Tweet for freedom"
            redirect_to new_tweet_path
        else
            flash[:warning] = "Invalid username or password"
            redirect_to 
        end
    end
end
