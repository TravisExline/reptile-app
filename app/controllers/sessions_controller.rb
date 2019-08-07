class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find(params[:id])
    if @user && @user.authenticate(params[:password])
      log_in(@user)
      redirect_to @user
    else
      flash.now[:message] = "Unable to Login"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil

    redirect_to '/'
  end
end
