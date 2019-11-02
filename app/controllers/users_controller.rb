class UsersController < ApplicationController
    def new
        @user = User.new
      end
    
      def create
        @user = User.new(user_params)
        if @user.save
          session[:user_id] = @user.id
          redirect_to root_path
        else
          render :new
        end
      end
    
      def edit
        @user = User.find(params[:id])
        if @user != current_user
          redirect_to root_path
        end
      end
    
      def show
        @user = User.find_by(:id => params[:id])
        if logged_in? && current_user == @user
          render :show
        else
          redirect_to new_session_path
        end
      end
    
      def update
        @user = User.find(params[:id])
        if @user.authenticate(params[:user][:old_password])
          if @user.update(user_params)
            redirect_to user_path(@user)
          else
            render :edit
          end
        else
          render :edit
        end
      end
      
      private
    
          def user_params
            params.require(:user).permit(:name, :email, :password)
          end
end
