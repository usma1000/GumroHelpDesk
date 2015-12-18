class CarriersController < ApplicationController
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

  def destroy
    @carrier = Carrier.find(params[:id])
    @carrier.destroy
    redirect_to carriers_url, notice: 'Carrier was successfully destroyed.'
  end

  private
    def carriers_params
      params.require(:carrier).permit(:name, :users_id)
    end
end
