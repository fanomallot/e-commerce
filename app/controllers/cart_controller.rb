class CartController < ApplicationController
before_action :authenticate_user!
def create
	@cart = Cart.new(user: current_user)
	if @cart.save
		redirect_to "/"
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

def destroy
		#delete
		@cart = Cart.find(params[:id])
		a = @cart.items
		a.delete(@cart.items.find(params[:item_id]))
		
		redirect_to cart_path(params[:id])
	end
end
