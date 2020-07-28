class ApplicationController < ActionController::Base
    

    def current_user 
        @current_user = User.find_by(id: session[:user_id])
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
