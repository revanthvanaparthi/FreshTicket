require 'rails_helper'

RSpec.describe "AgentsController", type: :request do
  current_agent = Agent.first_or_create!(name: 'Revanth', role_id: 5, report_to: 4,
    email: "r@gmail.com", password: "reva123", password_confirmation: "reva123")
  it "index works!" do
    get agents_path
    expect(response).to have_http_status(200)
  end

end
