class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'signup'
      redirect_to root_path
    else
      flash.now[:danger] = 'failed to singup'
      render :new
    end
    
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
