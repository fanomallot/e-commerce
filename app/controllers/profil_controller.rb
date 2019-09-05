class ProfilController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    if params[:profil] != nil
    	@user.profil.attach(params[:profil])
	end
    redirect_to(user_path(@user))
  end
end
