class ApplicationController < ActionController::Base
    before_action :authorize

    def current_user 
        @current_user = User.find_by(id: session[:user_id])
    end 

    def authorize
        redirect_to signup_path unless current_user 
    end
    
    def home

    end
    
    # def current_user
    #     session[:name]
    # end

    # def welcome
    #     redirect_to controller: 'application', action: 'home' unless session[:name]
    # end
    
    # private
    
    # def require_logged_in
    #     redirect_to controller: 'sessions', action: 'new' unless current_user
    # end

end
