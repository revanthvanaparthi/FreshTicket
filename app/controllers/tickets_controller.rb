class TicketsController < ApplicationController
  before_action :set_ticket, only: %i[ show edit update destroy ]
  before_action :valid_agent, only: [:create, :destroy]

  # GET /tickets or /tickets.json
  def index
    @tickets = Ticket.all
  end

  # GET /tickets/1 or /tickets/1.json
  def show
  end

  def tickets_status
    status = Status.find_by_name(params[:status].gsub('_',' '))
    @tickets = Ticket.where(status_id: status.id)
    render "tickets/index"
  end 

  def tickets_org
    org = Organisation.find_by_name(params[:org].gsub('_',' '))
    @tickets = Ticket.where(organisation_id: org.id)
    render "tickets/index"
  end

  def tickets_agent
    @tickets = show_ticket_by_agent(params[:agent])
    render "tickets/index"
  end

  def unassign_tickets
    @tickets = show_ticket_by_agent(nil)
    render "tickets/index"
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
  end

  # GET /tickets/1/edit
  def edit
  end

  # POST /tickets or /tickets.json
  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.status_id = 1;
    respond_to do |format|
      if @ticket.save
        format.html { redirect_to ticket_url(@ticket), notice: "Ticket was successfully created." }
        format.json { render :show, status: :created, location: @ticket }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  def valid_agent
    redirect_to tickets_path, notice: "Not Authorised to Create/Delete Tickets" if current_agent.role_id > 4
  end

  # PATCH/PUT /tickets/1 or /tickets/1.json
  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to ticket_url(@ticket), notice: "Ticket was successfully updated." }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1 or /tickets/1.json
  def destroy
    @ticket.destroy

    respond_to do |format|
      format.html { redirect_to tickets_url, notice: "Ticket was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ticket_params
      params.require(:ticket).permit(:title, :description, :status_id, :organisation_id, :agent_id)
    end

    def show_ticket_by_agent(agent)
      Ticket.where(agent_id: agent)
    end

end
