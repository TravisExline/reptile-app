class SessionsController < ApplicationController
  def new
    @users = User.all
  end

  def create
    @user = User.find_by(email: params[:email])
    # return head(:forbidden) unless @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect_to @user
  end

  def destroy
    session[:user_id] = nil

    redirect_to '/'
  end
end
