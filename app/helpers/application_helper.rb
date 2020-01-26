module ApplicationHelper

    def authenticate
        redirect_to new_session_path unless session.include? :user_id
    end
    
    def current_user
        @current_user ||= User.find_by_id(session[:user_id])
    end

    def logged_in?
        !!session[:user_id]
    end
end
