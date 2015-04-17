class ListsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    lists
  end

  def show
    @user = current_user
    list
  end

  def new
    @list = current_user.lists.new
  end

  def edit
    new_list.save
  end

  def create
    @list = List.new(list_params)
    @list.user_id = current_user.id
    if @list.save #new_list(list_params).save
      user_id = current_user.id
      redirect_to user_path(user_id)
    else
      render :new
    end
  end

  def upvote
    list.upvote_by current_user
    redirect_to :back
  end

  def downvote
    list.downvote_from current_user
    redirect_to :back
  end


private

  def lists
    @lists ||= List.all
  end

  def list
    @list ||= List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:title, recommendations_attributes: [ :mobile_app_id, :comment, :rating, :user_id ])
  end

  def new_list(attrs={})        
    @list ||= current_user.lists.build(attrs)
    # BUILDS RECOMMENDATION user_id
    @list.recommendations.build(attrs["recommendations_attributes"].values).each do |recommendation|
      recommendation["user_id"] = current_user.id
    end    
  end 

end

