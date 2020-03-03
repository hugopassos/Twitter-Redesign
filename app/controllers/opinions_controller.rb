class OpinionsController < ApplicationController
  include SessionsHelper

  def index
  end

  def new
    @opinion = Opinion.new
  end

  def create
    @opinion = current_user.opinions.build(opinion_params)
    if @opinion.save
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = 'Something went wrong'
      redirect_back(fallback_location: root_path)
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def opinion_params
    params.require(:opinion).permit(:text)
  end
end
