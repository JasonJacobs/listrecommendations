class ListsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    lists
  end

  def new
    new_list
  end

  def create
    if new_list(list_params).save
      user_id = current_user.id
      redirect_to user_path(user_id)
    else
      render :new
    end
  end

  def add_recommendation_form
    @f = params["f"]
    @list = params["list"]
    byebug
    respond_to do |format|
      format.js { }
    end
  end

private

  def lists
    @lists ||= List.all
  end

  def new_list(attrs={})
    @list ||= current_user.lists.build(attrs)
  end

  def list_params
    params.require(:list).permit(:title,
      recommendations_attributes: [ :comment, :rating ]
    )
  end
end
