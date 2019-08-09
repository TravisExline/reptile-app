class UsersController < ApplicationController
  before_action :require_login, only: :show

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      log_in(@user)
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :pet_count, :email, :password)
  end

  def require_login
    if !logged_in?
      redirect_to '/'
    end
  end
end
