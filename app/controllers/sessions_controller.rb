class SessionsController < ApplicationController
  include SessionsHelper

  def new
    redirect_to home_path if logged_in?
  end

  def create
    if (@user = User.find_by(username: params[:session][:username]))
      log_in(@user)
      redirect_to home_path
    else
      flash[:alert] = 'User not found.'
      render 'new'
    end
  end

  def destroy
  end
end
