class UsersController < ApplicationController
  def index
    @users = User.all 
  end

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
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if current_user
      if @user.update(user_params)
        redirect_to user_path(@user), alert: "This user has been updated"
      else
        render :edit
      end
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    if !current_user.id == @user.id
      @user.destroy
      flash[:notice] = "user destroyed successfully."
      redirect_to root_path
    else
      @user.destroy
      flash[:notice] = "user destroyed successfully."
      session.delete :user_id
      redirect_to new_session_path
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :admin)
  end
end
