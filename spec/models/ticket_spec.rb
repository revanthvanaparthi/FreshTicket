require 'rails_helper'

RSpec.describe Ticket, type: :model do
  
  current_agent = Agent.first_or_create!(name: 'Revanth', role_id: 5, report_to: 4,
    email: "r@gmail.com", password: "reva123", password_confirmation: "reva123")
  org = Organisation.first_or_create!(name: 'Microsoft', price: 75000)
  status = Status.first_or_create!(name: 'Ready for Testing')
  ticket = Ticket.first_or_create!(title: 't', description: 'd', organisation: org, agent: current_agent, status_id: status.id)

  it 'validate Title' do
    t = Ticket.new(
      title: '',
      description: 'Desc',
      organisation: org
    )
    expect(t).to_not be_valid
    t.title = 'Title'
    expect(t).to be_valid 
  end

  it 'validate Description' do
    t = Ticket.new(
      title: 'Title',
      description: '',
      organisation: org
    )
    expect(t).to_not be_valid
    t.description = 'Desc'
    expect(t).to be_valid 
  end

  it "show status of ticket" do
    expect(ticket.show_status).to eq('Ready for Testing')
  end

  it "show organisation assign to ticket" do
    expect(ticket.show_org).to eq(org.name)
  end

  it "show agent assign to ticket" do
    expect(ticket.show_agent).to eq(current_agent.name)
  end

end
