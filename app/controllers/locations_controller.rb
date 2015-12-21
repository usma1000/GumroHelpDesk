class LocationsController < ApplicationController
  before_action :set_location, only: [:edit, :update, :destroy]
  before_action :authenticate_user!

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

  def edit
  end

  def update
    if @location.update(locations_params)
      redirect_to locations_path, notice: 'Location was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @location.destroy
    redirect_to locations_url, notice: 'Location was successfully destroyed.'
  end

  private

    def set_location
      @location = Location.find(params[:id])
    end

    def locations_params
      params.require(:location).permit(:location, :carriers_id)
    end
end
