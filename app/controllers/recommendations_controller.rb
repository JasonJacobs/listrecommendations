class RecommendationsController < ApplicationController
  before_action :authenticate_user!

  def index
    recommendations
  end

  def show
    recommendation
  end

  def new
    new_recommendation
  end

  def create
    if new_recommendation(recommendation_params).save
      redirect_to new_recommendation
    else
      render :new
    end
  end

private

  def recommendations
    @recommendations ||= mobile_app.recommendations
  end

  def recommendation
    @recommendation ||= Recommendation.find(params[:id])
  end

  def new_recommendation(attrs={})
    @recommendation ||= mobile_app.recommendations.build(attrs.merge(user: current_user))
  end

  def mobile_app
    @mobile_app ||= MobileApp.find(params[:mobile_app_id])
  end

  def recommendation_params
    params.require(:recommendation).permit(:mobile_app_id, :comment, :rating, :tag_names)
  end

end
