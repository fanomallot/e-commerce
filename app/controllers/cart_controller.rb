class CartController < ApplicationController
	before_action :authenticate_user!
	before_action :is_cart_user?
	def new
		
	end

	def create
		@cart = Cart.new(user: current_user)
		if @cart.save
			redirect_back fallback_location: '/' ,allow_other_host: false
		else
			redirect_to "/"
		end
	end

	def show
		#calcul price
		@cart = current_user.cart #Card.find(1)
		@price = 0
		@cart.items.each do |i|
			@price = @price + i.price
		end
	end

	def update
		@cart = Cart.find(current_user.cart.id)
		@item = Item.find(params[:item_id])
		@cart.items << @item
		redirect_to root_path
	end

	def destroy
		#delete
		@cart = Cart.find(params[:id])
		a = @cart.items
		a.delete(@cart.items.find(params[:item_id]))		
		redirect_to cart_path(params[:id])
	end
	private
	def is_cart_user?
		if current_user.cart != nil
			@cart = Cart.find(params[:id])
			if current_user == @cart.user || current_user == admins
				return true
			else
				redirect_to root_path
			end
		end
	end
end
