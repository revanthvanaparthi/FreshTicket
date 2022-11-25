require 'rails_helper'

RSpec.describe Organisation, type: :model do

  current_agent = Agent.first_or_create!(name: 'Revanth', role_id: 5, report_to: 4,
    email: "r@gmail.com", password: "reva123", password_confirmation: "reva123")
  org = Organisation.first_or_create!(name: 'Microsoft', price: 75000)
  status = Status.first_or_create!(name: 'Ready for Testing')
  ticket = Ticket.first_or_create!(title: 't', description: 'd', organisation: org, agent: current_agent, status_id: status.id)

  describe "data validation" do
    it 'validate name' do
      org = Organisation.new(
        name: '',
        price: 25000
      )
      expect(org).to_not be_valid
      org.name = 'Freshworks'
      expect(org).to be_valid
    end
    it 'validate price' do
      org = Organisation.new(
        name: 'Freshworks'
      )
      expect(org).to_not be_valid
      org.price = 10000
      expect(org).to_not be_valid
      org.price = 11000
      expect(org).to be_valid
    end
  end
  it 'show tickets of organisation' do
    expect(org.show_tickets.count).to_not be(0)
  end
  
end
