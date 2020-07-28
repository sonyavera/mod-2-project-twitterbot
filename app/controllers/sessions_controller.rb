class SessionsController < ApplicationController

    def new
    end

    def create
        if params[:name] == nil
            redirect_to controller: 'sessions', action: 'new'
        elsif
            params[:name].empty?
            redirect_to controller: 'sessions', action: 'new'
        else
            session[:name] = params[:name]
            redirect_to controller: 'application', action: 'account'
        end
    end
end