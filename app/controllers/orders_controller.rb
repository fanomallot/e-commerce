class OrdersController < ApplicationController

	def new
		@item
	end

	def create
		o = Order.new(user:current_user)
		c = Cart.find(params[:cart_id])
		puts "*"*90
		puts c.items
		o.items = c.items
		if o.save 
			# Amount in cents
			@totalprice = params[:prix]
		  @amount = @totalprice

		  customer = Stripe::Customer.create({
		    email: params[:stripeEmail],
		    source: params[:stripeToken],
		  })

		  charge = Stripe::Charge.create({
		    customer: customer.id,
		    amount: @amount,
		    description: 'Rails Stripe customer',
		    currency: 'usd',
		  })

			c.items = []
			  redirect_to root_path

			# rescue Stripe::CardError => e
			#   flash[:error] = e.message
			# end
			
		else 
			redirect_to cart_path(params[:cart_id])
		end	
	end

end