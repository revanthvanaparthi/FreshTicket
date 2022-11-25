require 'rails_helper'

RSpec.describe Agent, type: :model do
  
    current_agent = Agent.first_or_create!(name: 'Revanth', role_id: 5, report_to: 4,
      email: "r@gmail.com", password: "reva123", password_confirmation: "reva123")
    org = Organisation.first_or_create!(name: 'Microsoft', price: 75000)
    status = Status.first_or_create!(name: 'Ready for Testing')
    role1 = Role.find_or_create_by(name: 'CEO')
    role2 = Role.find_or_create_by(name: 'Director')
    role3 = Role.find_or_create_by(name: 'Manager')
    role4 = Role.find_or_create_by(name: 'Lead Software Engineer')
    role5 = Role.find_or_create_by(name: 'Senior Software Engineer')
    role6 = Role.find_or_create_by(name: 'Software Engineer')
    ticket = Ticket.first_or_create!(title: 't', description: 'd', organisation: org, agent: current_agent, status_id: status.id)
    
    it 'set reporter of agent' do
        expect(current_agent.set_reporter).to be_nil
    end

    it 'show reporter of agent' do
        expect(current_agent.show_reporter).to eq('Revanth')
        expect(Agent.first.show_reporter).to eq('Revanth')

    end

    it 'show role of agent' do
        expect(current_agent.show_role).to eq(role5.name)
    end

    it 'recet tickets of agent' do
        expect(Agent.first.reset_tickets).to_not be_nil
    end

    it 'show team of agent' do
        expect(current_agent.show_team).to_not be_nil
        current_agent.role_id = 3
        expect(current_agent.show_team).to_not be_nil
    end
  
end
