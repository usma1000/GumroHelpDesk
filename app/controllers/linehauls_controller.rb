class LinehaulsController < ApplicationController
  before_action :set_linehaul, only: [:show, :edit, :update, :destroy]

  # GET /linehauls
  # GET /linehauls.json
  def index
    @linehauls = Linehaul.all
  end

  # GET /linehauls/1
  # GET /linehauls/1.json
  def show
  end

  # GET /linehauls/new
  def new
    @linehaul = Linehaul.new
  end

  # GET /linehauls/1/edit
  def edit
  end

  # POST /linehauls
  # POST /linehauls.json
  def create
    @linehaul = Linehaul.new(linehaul_params)

    respond_to do |format|
      if @linehaul.save
        format.html { redirect_to @linehaul, notice: 'Linehaul was successfully created.' }
        format.json { render :show, status: :created, location: @linehaul }
      else
        format.html { render :new }
        format.json { render json: @linehaul.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /linehauls/1
  # PATCH/PUT /linehauls/1.json
  def update
    respond_to do |format|
      if @linehaul.update(linehaul_params)
        format.html { redirect_to @linehaul, notice: 'Linehaul was successfully updated.' }
        format.json { render :show, status: :ok, location: @linehaul }
      else
        format.html { render :edit }
        format.json { render json: @linehaul.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /linehauls/1
  # DELETE /linehauls/1.json
  def destroy
    @linehaul.destroy
    respond_to do |format|
      format.html { redirect_to linehauls_url, notice: 'Linehaul was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_linehaul
      @linehaul = Linehaul.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def linehaul_params
      params.require(:linehaul).permit(:route)
    end
end
