class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        if auth_hash
            user = User.find_or_create_by_omniauth(auth_hash)
            session[:user_id] = user.id
            redirect_to root_path
        else
            @user = User.find_by(email: params[:email])
            if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to root_path
            else
                render :new
            end
        end
    end

    def destroy
        session.delete :user_id
        redirect_to new_session_path
    end

    private

    def auth_hash
        request.env['omniauth.auth']
    end
end
