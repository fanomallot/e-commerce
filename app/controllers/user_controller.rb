class UsersController < ApplicationController
   def index
   	@uers = User.all
  	
  end
    def create
    
    @user = User.new(first_name:params[:first_name], last_name:params[:last_name], description:params[:description], email:params[:email])

    if @user.save 

    flash[:success] = "Ton event qui déchire a été ajouté dans la liste!"
    redirect_to user_path(@user.id)

    else

    render 'new'

    end
  end
  def edit
  	@users = User.find(params[:id])
  end


  def update
    @user = User.find(params[:id])
   if @user.update(first_name: params[:first_name],last_name: params[:last_name], description: params[:description],email: params[:email])
        flash[:success] = "profil  a été édité!"
        redirect_to user_path(@user.id)
  else
      render :edit
  end

  end

  def views
  end
   def show
    @user = User.find params[:id]
  end
  def destroy
 
  	
  end


end
