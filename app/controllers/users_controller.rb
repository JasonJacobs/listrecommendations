class UsersController < ApplicationController

	def index
		users
	end

	def show
		user
	end

  def favorites
    user
    lists
  end

private

  def users
    @users ||= User.all
  end

  def user
    @user ||= User.find(params[:id])
  end

  def lists
    @lists ||= List.all
  end

end
