class UsersController < ApplicationController
    skip_before_action :authorize, only: [:signup, :create, :logout]
    # before_action :set_user, only: [:account, :update]

    def signup
        @user = User.new
    end

    def account
        @user = User.find_by(id: session[:user_id])
    end

    def create
       user  = User.create(user_params)
       if user.valid?
        session[:user_id] = user.id 
        flash[:success] = "Thanks #{user.first_name} for creating your account! You are now logged in. It is time for you to Tweet for freedom!"
        redirect_to new_tweet_path 
       else
        flash[:errors] = users.errors.full_messages
        redirect_to new_user_path(user)
       end 
    end

    def edit
    end

    def update
        @user.update(user_params)
        if user.valid?
            session[:user_id] = user.id 
            redirect_to new_tweet_path
           else
            flash[:errors] = users.errors.full_messages
            redirect_to edit_account_path(@user.id)
        end 
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :username, :password)
    end

    def set_user
        @user = User.find(params[:id])
    end

end
