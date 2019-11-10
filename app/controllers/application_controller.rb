class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?
    
    def authenticate
        redirect_to new_session_path unless session.include? :user_id
    end

    def current_user
        current_user ||= User.find_by(:id => session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!session[:user_id]
    end

end
