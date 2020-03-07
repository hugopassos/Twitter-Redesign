class OpinionsController < ApplicationController
  include SessionsHelper

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

  def destroy
    @opinion = Opinion.find_by(id: params[:id])
    if @opinion.destroy
      flash[:notice] = 'Opinion deleted'
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = 'Something went wrong'
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def opinion_params
    params.require(:opinion).permit(:text)
  end
end
