class TicketsController < ApplicationController
  before_action :set_ticket, only: [:priority_status, :open_status, :waiting_status, :done_status, :trashed_status, :show, :edit, :update, :destroy]
  before_action :ticket_head_param, only: [:index, :priority, :waiting, :done, :trashed]
  before_action :authenticate_user!


  def priority_status
    @ticket.priority = !@ticket.priority
    @ticket.save
    redirect_to :back
  end

  def open_status
    @ticket.update(status: 0)
    @ticket.save
    redirect_to :back
  end

  def waiting_status
    @ticket.update(status: 1)
    @ticket.save
    redirect_to :back
  end

  def done_status
    @ticket.update(status: 2)
    @ticket.save
    redirect_to :back
  end

  def trashed_status
    @ticket.update(status: 3)
    @ticket.save
    redirect_to :back
  end

  # GET /tickets
  # GET /tickets.json
  def index
    @tickets_open = Ticket.where(:user_id => current_user.id).open
    @tickets_grid = initialize_grid(@tickets_open, csv_file_name: 'Open Tickets')
    export_grid_if_requested
  end

  def priority
    @tickets_grid = initialize_grid(@tickets_priority, csv_file_name: 'Priority Tickets')
    export_grid_if_requested
  end

  def waiting
    @tickets_waiting = Ticket.where(:user_id => current_user.id).all.waiting
    @tickets_grid = initialize_grid(@tickets_waiting, csv_file_name: 'Waiting Tickets')
    export_grid_if_requested
  end

  def done
    @tickets_done = Ticket.where(:user_id => current_user.id).all.done
    @tickets_grid = initialize_grid(@tickets_done, csv_file_name: 'Done Tickets')
    export_grid_if_requested
  end

  def trashed
    @tickets_trashed = Ticket.where(:user_id => current_user.id).all.trashed
    @tickets_grid = initialize_grid(@tickets_trashed, csv_file_name: 'Trashed Tickets')
    export_grid_if_requested
  end
  # GET /tickets/1
  # GET /tickets/1.json
  def show
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
    @locations = Location.all
  end

  # GET /tickets/1/edit
  def edit
  end

  # POST /tickets
  # POST /tickets.json
  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.user_id = current_user.id
    respond_to do |format|
      if @ticket.save
        format.html { redirect_to @ticket, notice: 'Ticket was successfully created.' }
        format.json { render :show, status: :created, location: @ticket }
      else
        format.html { render :new }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tickets/1
  # PATCH/PUT /tickets/1.json
  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to @ticket, notice: 'Ticket was successfully updated.' }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to tickets_url, notice: 'Ticket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    def ticket_head_param
      @tickets = Ticket.where(:user_id => current_user.id).except(:done, :trashed)
      @tickets_priority = Ticket.where(:user_id => current_user.id).priority.allopen
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_params
      params.require(:ticket).permit(:from, :subject, :content, :user_id, :status, :priority, :store_id)
    end
end
