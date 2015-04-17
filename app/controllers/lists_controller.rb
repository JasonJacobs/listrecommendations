class ListsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    lists
  end

  def show
    @user = current_user
    list
    binding.pry
  end

  def new
    @list = current_user.lists.new
  end

  def edit
    new_list.save
  end

  def create
    @list = List.new(list_params)
    if new_list(list_params).save
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

end

