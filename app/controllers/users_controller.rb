class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def show
  end

  def edit
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save

    session[:user_id] = @user.id
    redirect_to home_path
  end

  def update
  end

  def destroy
  end

  private def user_params
    params.require(:user).permit(:username, :password)
  end
end
