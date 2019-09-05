class OrdersController < ApplicationController

	def new
		@totalprice = params[:prix]
	end




	def create

		a = 5000
		customer = Stripe::Customer.create({
		email: params[:stripeEmail],
		source: params[:stripeToken],
		})

		charge = Stripe::Charge.create({
		customer: customer.id,
		amount: a,
		description: 'Rails Stripe customer',
		currency: 'usd',
		})

		@o = Order.new(user:current_user)
		c = current_user.cart
		puts "*"*90
		puts params[:cart_id]
		puts c.items
		@o.items = c.items

		if @o.save
		current_user.cart.items = []
		redirect_to root_path
		else
		redirect_to orders_path(params[:cart_id])
		end

		rescue Stripe::CardError => e
		flash[:error] = e.message 
	end


end
