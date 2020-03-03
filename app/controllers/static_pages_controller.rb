class StaticPagesController < ApplicationController
  before_action :load_opinions, only: :home
  before_action :load_who_to_follow, only: :home

  include SessionsHelper
  include UsersHelper

  def home
    redirect_to login_path if !logged_in?
  end

  private

  def load_opinions
    @opinions = Opinion.most_recent
  end

  def load_who_to_follow
    @users = who_to_follow.reject{ |user| user == current_user } if !current_user.nil?
  end
end
