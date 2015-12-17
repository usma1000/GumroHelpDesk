class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(locations_params)
    if @location.save
      redirect_to locations_path, notice: 'Location was successfully created.'
    else
      render :new, notice: 'You screwed up!'
    end
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    redirect_to locations_url, notice: 'Location was successfully destroyed.'
  end

  private
    def locations_params
      params.require(:location).permit(:location, :carriers_id)
    end
end
