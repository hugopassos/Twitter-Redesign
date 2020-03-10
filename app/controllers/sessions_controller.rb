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
    log_out if logged_in?
    redirect_to root_url
  end
end
