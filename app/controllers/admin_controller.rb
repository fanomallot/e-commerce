class AdminController < ApplicationController

	before_action :is_admins 
	def index
	end
	private
	def is_admins
		if user_signed_in?
			if current_user == admins
				return true
			else
				redirect_to item_index_path
			end
		else
			redirect_to item_index_path
		end
	end
end
