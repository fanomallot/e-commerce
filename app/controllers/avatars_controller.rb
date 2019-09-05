class AvatarsController < ApplicationController

  def create
  	@item = Item.find(params[:item_id])
  	if params[:avatar] != nil
  		@item.avatar.attach(params[:avatar])
  	end
  	redirect_to(item_path(@item))
  end
  
end
