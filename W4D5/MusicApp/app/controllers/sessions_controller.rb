class SessionsController < ApplicationController
  def new
    
  end

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user 
      log_in_user(@user)
      redirect_to user_url(@user)
    else 
      flash[:errors] = ["Invalid Username or Password"]
    end 
  end

  def destroy
  end
  
  
end
