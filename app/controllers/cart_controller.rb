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

end
