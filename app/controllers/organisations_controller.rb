class OrganisationsController < ApplicationController
  before_action :set_organisation, only: %i[ show edit update destroy ]
  before_action :valid_agent, only: [:create, :edit, :destroy]

  # GET /organisations or /organisations.json
  def index
    @organisations = Organisation.all
  end

  # GET /organisations/1 or /organisations/1.json
  def show
  end

  def premium_orgs
    @organisations = Organisation.where("price >= ?",25000)
    render 'organisations/index'
  end

  # GET /organisations/new
  def new
    @organisation = Organisation.new
  end

  # GET /organisations/1/edit
  def edit
  end

  # POST /organisations or /organisations.json
  def create
    @organisation = Organisation.new(organisation_params)

    respond_to do |format|
      if @organisation.save
        format.html { redirect_to organisation_url(@organisation), notice: "Organisation was subscribed." }
        format.json { render :show, status: :created, location: @organisation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @organisation.errors, status: :unprocessable_entity }
      end
    end
  end

  def valid_agent
    redirect_to organisations_path, notice: "Not Authorised to Subscribe/Unsubscribe/Edit An Organisation" if current_agent.role_id > 2
  end

  # PATCH/PUT /organisations/1 or /organisations/1.json
  def update
    respond_to do |format|
      if @organisation.update(organisation_params)
        format.html { redirect_to organisation_url(@organisation), notice: "Organisation was successfully updated." }
        format.json { render :show, status: :ok, location: @organisation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @organisation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organisations/1 or /organisations/1.json
  def destroy
    @organisation.destroy

    respond_to do |format|
      format.html { redirect_to organisations_url, notice: "Organisation was unsubscribed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organisation
      @organisation = Organisation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def organisation_params
      params.require(:organisation).permit(:name, :price)
    end

end
