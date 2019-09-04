class ItemController < ApplicationController

	def index
		@item = Item.all
		if current_user.cart != nil
			@cart = current_user.cart
		end
	end

	def show
		@item = Item.find(params[:id])
		if current_user.cart != nil
			@cart = current_user.cart
		end
	end

	def new
		@item = Item.new
	end

	def create
		@item = Item.new(title: params[:title], image_url: params[:image_url], price: params[:price], description: params[:description])
		if @item.save
			redirect_to root_path
		else
			render "new"
		end
	end

	def edit
		@item = Item.find(params[:id])
	end

	def update
		@item = Item.find(params[:id])
		if @item.update(title: params[:title], image_url: params[:image_url], price: params[:price], description: params[:description])
			redirect_to item_path(@item)
		else
			render "edit"
		end
	end

	def destroy
		@item = Item.find(params[:id])
		@item.destroy
		redirect_to root_path	
	end
end
