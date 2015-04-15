class RecommendationsController < ApplicationController
  before_action :authenticate_user!
  respond_to :html
  respond_to :js, only: %i[new]

  def index
    recommendations
  end

  def show
    recommendation
  end

  def new
    respond_to do |format|
      format.html { new_recommendation }
      format.js do 
        render_to_string partial: "recommendations/fields_for", 
                         object: Recommendation.new
      end
    end
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
