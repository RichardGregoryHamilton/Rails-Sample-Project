class SessionsController < ApplicationController
  
  def new
  end

  # Create a session

  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
    # Sign in the user & redirect to users show page
    sign_in user
    redirect_back_or user
    else
      flash.now[:danger] = 'Invalid username or password'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to games_path
  end
  
end