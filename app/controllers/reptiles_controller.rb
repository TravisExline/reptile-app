class ReptilesController < ApplicationController
  def show
    @reptiles = Reptile.all
  end

  def new
    @reptile = Reptile.new
  end

  def create
    @reptile = Reptile.new(reptile_params)
    if @reptile.valid?
      @reptile.save
      redirect_to reptile_path(@reptile)
    else
      render :new
    end
  end

  def edit
    @reptile = Reptile.find(params[:id])
    redirect_to reptile_path(@reptile)
  end

  def update
    @reptile = Reptile.find(params[:id])
    @reptile.update(reptile_params)
    redirect_to reptile_path(@reptile)
  end

  private

  def reptile_params
    params.require(:reptile).permit(:name, :species, :offspring)
  end
end
