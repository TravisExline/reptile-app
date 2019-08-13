class ReptilesController < ApplicationController

  def index
    if params[:user_id]
      @reptiles = User.find(params[:user_id]).reptiles
    else
      @reptiles = Reptile.all
    end
  end

  def show
    # @user = User.find(params[:id])
    @reptile = Reptile.find(params[:id])
  end

  def new
    @reptile = Reptile.new
  end

  def create
    @reptile = Reptile.new(reptile_params)
    @user = current_user
    @reptile.user_id = @user.id
    if @reptile.valid?
      @reptile.save
      redirect_to reptile_path(@reptile)
    else
      render :new
    end
  end

  def edit
    @reptile = Reptile.find(params[:id])
  end

  def update
    @reptile = Reptile.find(params[:id])
    @reptile.update(reptile_params)
    redirect_to reptile_path(@reptile)
  end

  private

  def reptile_params
    params.require(:reptile).permit(:name, :species, :age, :offspring)
  end
end
