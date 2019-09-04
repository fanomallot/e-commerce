class UserController < ApplicationController
	before_action :authenticate_user!
	before_action :is_current_user? ,only: [:show,:edit]
	def show
		@user = User.find(params[:id])
	end
	def edit
		@user = User.find(params[:id])
	end
	def update
		@user = User.find(params[:id])
		if @user.update(first_name: params[:first_name],
			last_name: params[:last_name],
			description: params[:description])
			redirect_to user_path(@user.id)
		else
			render edit
		end
	end
	private
	def is_current_user?
		@user = User.find(params[:id])
		if current_user == @user || @user == admins
			return true
		else
			redirect_to root_path
		end
	end
end
