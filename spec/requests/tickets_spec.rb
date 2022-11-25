require 'rails_helper'

RSpec.describe "TicketsController", type: :request do
  
  current_agent = Agent.first_or_create!(name: 'Revanth', role_id: 5, report_to: 4,
    email: "r@gmail.com", password: "reva123", password_confirmation: "reva123")
  org = Organisation.first_or_create!(name: 'Microsoft', price: 75000)
  status = Status.first_or_create!(name: 'Ready for Testing')
  ticket = Ticket.first_or_create!(title: 't', description: 'd', organisation: org, agent: current_agent, status_id: status.id)

  describe "GET /tickets" do

    it "index works!" do
      get root_path
      expect(response).to have_http_status(200)
    end

    it "show works!" do
      get ticket_path(id: ticket.id)
      expect(response).to have_http_status(200)
    end

    it "tickets_status works!" do
      get tickets_status_path(status: status.name)
      expect(response).to have_http_status(200)
    end

    it "tickets_org works!" do
      get tickets_org_path(org: org.name)
      expect(response).to have_http_status(200)
    end

    it "unassign_tickets works!" do
      get unassign_tickets_path
      expect(response).to have_http_status(200)
    end
  end

  describe "After Login" do

    it "new works!" do
      get new_ticket_path
      assert_response :redirect
    end

    it "edit works!" do
      get edit_ticket_path(id: ticket.id)
      assert_response :redirect
    end

  end
end
