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
    if current_user.admin?
      @tickets_open = Ticket.all.open
      @tickets_waiting = Ticket.all.waiting
    else
      @tickets_open = Ticket.where(:carrier_id => current_user.carrier_id).open
    end
    @tickets_grid = initialize_grid(@tickets_open, csv_file_name: 'Open Tickets')
    export_grid_if_requested
  end

  def priority
    @tickets_grid = initialize_grid(@tickets_priority, csv_file_name: 'Priority Tickets')
    export_grid_if_requested
  end

  def waiting
    if current_user.admin?
      @tickets_waiting = Ticket.all.waiting
      @tickets_open = Ticket.all.open
    else
      @tickets_waiting = Ticket.where(:carrier_id => current_user.carrier_id).all.waiting
    end
    @tickets_grid = initialize_grid(@tickets_waiting, csv_file_name: 'Waiting Tickets')
    export_grid_if_requested
  end

  def done
    if current_user.admin?
      @tickets_done = Ticket.all.done
    else
      @tickets_done = Ticket.where(:carrier_id => current_user.carrier_id).all.done
    end
    @tickets_grid = initialize_grid(@tickets_done, csv_file_name: 'Done Tickets')
    export_grid_if_requested
  end

  def trashed
    if current_user.admin?
      @tickets_trashed = Ticket.all.trashed
    else
      @tickets_trashed = Ticket.where(:carrier_id => current_user.carrier_id).all.trashed
    end
    @tickets_grid = initialize_grid(@tickets_trashed, csv_file_name: 'Trashed Tickets')
    export_grid_if_requested
  end
  # GET /tickets/1
  # GET /tickets/1.json
  def show
    commontator_thread_show(@ticket)
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
    @locations = Location.all
    @carrier = current_user.carrier
  end

  # GET /tickets/1/edit
  def edit
    @carrier = current_user.carrier
  end

  # POST /tickets
  # POST /tickets.json
  def create
    @carrier = current_user.carrier
    @ticket = Ticket.new(ticket_params)
    @ticket.user_id = current_user.id
    @ticket.carrier_id = current_user.carrier_id
    respond_to do |format|
      if @ticket.save
        # Send an email to h&m@gumroandassociates.com after save with ticket subject, email, and store.
        TicketMailer.new_ticket_email(@ticket).deliver_now

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
      if current_user.admin?
        @tickets = Ticket.all.except(:done, :trashed)
        @tickets_priority = Ticket.all.priority.allopen
      else
        @tickets = Ticket.where(:user_id => current_user.id).except(:done, :trashed)
        @tickets_priority = Ticket.where(:user_id => current_user.id).priority.allopen
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_params
      params.require(:ticket).permit(:from, :subject, :content, :user_id, :status, :priority, :store_id, :linehaul_id)
    end
end
