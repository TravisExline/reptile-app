class SessionsController < ApplicationController
  def new
    @users = User.all
  end

  def create
    if @user = User.find_by(name: params[:name])
      return head(:forbidden) unless @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      @user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.name = auth['info']['name']
        u.email = auth['info']['email']
        u.image = auth['info']['image']
      end
      session[:user_id] = @user.id
      redirect_to @user
    end
  end

  def destroy
    session[:user_id] = nil

    redirect_to '/'
  end
end
