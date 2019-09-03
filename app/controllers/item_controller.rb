class ItemController < ApplicationController
	before_action :authenticate_user!, only: [:show, :create]

	def index
		@item = Item.all
	end

	def show
		@item = Item.find(params[:id])
	end

	def new
		# @item = Item.new
	end

	def create
		# @item = Item.new(title: params[:title], image_url: params[:image_url], price: params[:price], description: params[:description])
	end

	def edit
		
	end

	def update
		
	end

	def destroy
		
	end
end
