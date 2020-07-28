class UsersController < ApplicationController
    before_action :set_user, only: [:account, :update]

    def signup
        @user = User.new
    end

    def account
    end

    def create
       user  = User.create(user_params)
       if user.valid?
        session[:user_id] = user.id 
        redirect_to new_tweet_path #does this connect the new tweet with the user?
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
