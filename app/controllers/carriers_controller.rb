class CarriersController < ApplicationController
  before_action :set_carrier, only: [:edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @carrier = Carrier.all
  end

  def new
    @carrier = Carrier.new
  end

  def create
    @carrier = Carrier.new(carriers_params)
    if @carrier.save
      redirect_to carriers_path, notice: 'Carrier was successfully created.'
    else
      render :new, notice: 'You screwed up!'
    end
  end

  def edit
  end

  def update
    if @carrier.update(carriers_params)
      redirect_to carriers_path, notice: 'Carrier was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @carrier.destroy
    redirect_to carriers_url, notice: 'Carrier was successfully destroyed.'
  end

  private

    def set_carrier
      @carrier = Carrier.find(params[:id])
    end

    def carriers_params
      params.require(:carrier).permit(:name)
    end
end
