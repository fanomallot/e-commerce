class CartController < ApplicationController
	def show
		#calcul price
		@cart = Cart.find(2)  #current_user.cart
		@price = 0
		@cart.items.each do |i|
			@price = @price + i.price
		end
	end

	def destroy
		#delete
		@cart = Cart.find(params[:id])
		a = @cart.items
		a.delete(@cart.items.find(params[:item_id]))
		
		redirect_to cart_path(params[:id])
	end
end
