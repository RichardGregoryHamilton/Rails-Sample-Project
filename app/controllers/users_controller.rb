class UsersController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Congratulations #{@user.name}! You have successfully created an account"
      redirect_to games_path
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
	
	if @user.update_attributes(user_params)
	  redirect_to @user
	  flash[:success] = "Your profile has been updated"
	else
	  render 'edit'
	end
  end
  
  def favorites
    @user = User.find(current_user)
  end
  
  def destroy
  end
  
  private
  
    def user_params
     params.require(:user).permit(:name, :email, :password, :password_confirmation, :location, :birthday)
   end
 
   def signed_in_user
     unless signed_in?
       store_location
       redirect_to signin_url notice: "Please sign in."
     end
   end
 
   def correct_user
     @user = User.find(params[:id])
     redirect_to(root_url) unless current_user?(@user)
   end
end