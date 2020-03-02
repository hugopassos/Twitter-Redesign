class StaticPagesController < ApplicationController
  include SessionsHelper

  def home
    redirect_to login_path if !logged_in?
  end
end
