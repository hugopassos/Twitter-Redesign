class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'Account created!'
      redirect_to home_path
    else
      flash[:alert] = 'Something went wrong.'
      render 'new'
    end
  end

  def show
  end

  def update
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:username, :full_name)
  end
end
