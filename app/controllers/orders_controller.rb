class OrdersController < ApplicationController
	
	def create
		@o = Order.new(user:current_user)
		c = Cart.find(params[:cart_id])
		 puts "*"*90
		 puts c.items
		 Order.new(user: current_user)
			@o.items = c.items
			if @o.save 
				c.items = []
				redirect_to "/"
			else 
				redirect_to cart_path(params[:cart_id])
			end	
	end

end
