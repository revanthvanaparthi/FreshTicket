class AgentsController < ApplicationController
    before_action :set_agent, only: %i[ show edit update ]

    def index
        render json: Agent.all
    end

    # GET /tickets/1 or /tickets/1.json
    def show
        render json: @ticket
    end
    private

    def set_agent
        @ticket = Agent.find(params[:id])
    end
end