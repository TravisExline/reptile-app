class ReptilesController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  private

  def reptile_params
    params.require(:reptile).permit(:name, :species, :offspring)
  end
end
