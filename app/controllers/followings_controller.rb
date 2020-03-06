class FollowingsController < ApplicationController
  include SessionsHelper

  def create
    @following = current_user.followings.create(following_id: params[:id])
    if @following.save
      flash[:notice] = 'You are now following this user'
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = 'Something went wrong'
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    if @following = (Following.where(user_id: current_user.id, following_id: params[:id]).first)
      @following.destroy
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = 'Something went wrong'
      redirect_back(fallback_location: root_path)
    end
  end
end
