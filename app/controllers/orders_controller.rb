class OrdersController < ApplicationController

	def new
	end

	def create
		o = Order.new(user:current_user)
		c = Cart.find(params[:cart_id])
		puts "*"*90
		puts c.items
		o.items = c.items
		if o.save 
			c.items = []
			redirect_to root_path
		else 
			redirect_to cart_path(params[:cart_id])
		end	

end