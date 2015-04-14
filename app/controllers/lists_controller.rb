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
      redirect_to new_list
    else
      render :new
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
