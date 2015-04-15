class UsersController < ApplicationController

	def index
		users
	end

	def show
		user
	end

private

  def users
    @users ||= User.all
  end

  def user
    @user ||= User.find(params[:id])
  end	

end
