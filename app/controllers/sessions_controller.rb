class SessionsController < ApplicationController
  def new; end

  def create
    if (@user = User.find_by(username: params[:username]))
      redirect_to home_path
    else
      flash[:alert] = 'User not found.'
      render 'new'
    end
  end

  def destroy
  end
end
