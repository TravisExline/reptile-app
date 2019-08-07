class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  private

  def user_params
    params.require(:user).permit(:name, :pet_count, :password)
  end
end
