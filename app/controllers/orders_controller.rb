class OrdersController < ApplicationController

	def new
		@totalprice = params[:prix]
	end

	def create
		
		# Amount in cents
		@totalprice = params[:prix]
		@amount = 2500

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

		current_user.cart.items = []

	rescue Stripe::CardError => e
		flash[:error] = e.message
		redirect_to root_path
	end
end
