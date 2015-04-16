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
    new_list
  end

  def edit
    new_list.save
  end

  def create
    if new_list(list_params).save
      user_id = current_user.id
      redirect_to user_path(user_id)
      recommendation_ids = params["list"]["recommendations_attributes"]
      recommendation_ids.each do |recommendation, recommendation_values|
        recommendation_values.each do |recommendation_key, recommendation_value|
        end
      end
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

  def new_list(attrs={})
    @list ||= current_user.lists.build(attrs)
  end

  def list_params
    params.require(:list).permit(:title,
      recommendations_attributes: [ :comment, :rating ]
    )
  end
end





def update
    if params["student"]["student_subjects_attributes"]
      subject_ids = params["student"]["student_subjects_attributes"]["0"]["subject_id"]
      subject_ids.each do |subject_id|
        StudentSubject.create(:subject_id => subject_id, :student_id => current_student.id)
      end
    end
    redirect_to student_path(current_student)
  end 

  private
    def student_params
      params.require(:student).permit(:name, :email, :uid, :provider, :secret, :oauth_token, :student_subjects_attributes => [:subject_id => []])
    end

end
