class ApplicationController < ActionController::Base
    before_action :authorize, except: [:home]
    

    def current_user 
        @current_user = User.find_by(id: session[:user_id])
    end 

    def authorize
        redirect_to root_path unless current_user 
        flash[:authorization_message] = "You are not logged in or have an account, so we navigated you back to the home page"
    end
    
    def home

    end

end
